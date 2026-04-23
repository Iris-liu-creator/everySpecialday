import SwiftUI

struct AIChatView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    let aiProvider: AIProvider

    @State private var mode: AIChatMode = .noMemory
    @State private var draft = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(role: .assistant, text: "What would feel useful to reflect on right now?")
    ]
    @State private var isSending = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                modeHeader
                Divider()
                messageList
                composer
            }
            .background(QBColors.background)
            .navigationTitle("AI Chat")
            .onAppear {
                mode = repository.privacySettings.defaultChatMode
            }
        }
    }

    private var modeHeader: some View {
        VStack(alignment: .leading, spacing: QBSpacing.small) {
            Picker("Chat mode", selection: $mode) {
                ForEach(AIChatMode.allCases, id: \.self) { mode in
                    Text(mode.displayName).tag(mode)
                }
            }
            .pickerStyle(.segmented)

            Label(mode.privacySummary, systemImage: mode == .memory ? "lock.shield" : "eye.slash")
                .font(QBTypography.quiet)
                .foregroundStyle(QBColors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(QBSpacing.medium)
        .background(QBColors.elevatedBackground)
    }

    private var messageList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: QBSpacing.medium) {
                ForEach(messages) { message in
                    messageBubble(message)
                }
            }
            .padding(QBSpacing.medium)
        }
    }

    private func messageBubble(_ message: ChatMessage) -> some View {
        HStack {
            if message.role == .user {
                Spacer(minLength: QBSpacing.large)
            }

            Text(message.text)
                .font(QBTypography.body)
                .foregroundStyle(QBColors.textPrimary)
                .padding(QBSpacing.medium)
                .background(
                    message.role == .user ? QBColors.mist : QBColors.elevatedBackground,
                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                )

            if message.role != .user {
                Spacer(minLength: QBSpacing.large)
            }
        }
    }

    private var composer: some View {
        HStack(alignment: .bottom, spacing: QBSpacing.small) {
            TextField("Write what is on your mind", text: $draft, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(1...4)

            Button {
                Task { await send() }
            } label: {
                Image(systemName: isSending ? "hourglass" : "arrow.up.circle.fill")
                    .font(.title2)
            }
            .disabled(draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isSending)
            .accessibilityLabel("Send message")
        }
        .padding(QBSpacing.medium)
        .background(QBColors.elevatedBackground)
    }

    private func send() async {
        let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }

        let userMessage = ChatMessage(role: .user, text: text)
        messages.append(userMessage)
        draft = ""
        isSending = true

        let context = mode == .memory
            ? AIMemoryContext(
                recentReflections: Array(repository.reflections.prefix(3)),
                recentAppreciationEntries: Array(repository.appreciationEntries.prefix(3)),
                activeGoals: repository.goals.filter { $0.status == .active }
            )
            : nil

        do {
            let response = try await aiProvider.sendMessage(
                AIChatRequest(
                    mode: mode,
                    userMessage: text,
                    conversation: messages,
                    memoryContext: context
                )
            )
            messages.append(response.message)
        } catch {
            messages.append(
                ChatMessage(
                    role: .assistant,
                    text: "I could not respond from the MVP stub. Your message stayed local in this prototype."
                )
            )
        }

        isSending = false
    }
}

#Preview {
    AIChatView(aiProvider: StubAIProvider())
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

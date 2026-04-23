import SwiftUI

struct AppreciationEntryView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    @State private var selectedPersonID: UUID?
    @State private var appreciationNote = ""
    @State private var memoryStory = ""
    @State private var whyTheyMatterToday = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    QBSectionCard(
                        title: "Private appreciation",
                        subtitle: "Write the version that is true, not polished."
                    ) {
                        personPicker
                        textField("Appreciation note", text: $appreciationNote)
                        textEditor("Memory or story", text: $memoryStory)
                        textEditor("Why this person matters today", text: $whyTheyMatterToday)

                        Button {
                            Task { await saveEntry() }
                        } label: {
                            Label("Save privately", systemImage: "lock")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(QBColors.accent)
                        .disabled(selectedPersonID == nil || appreciationNote.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }

                    timeline
                }
                .padding(QBSpacing.medium)
            }
            .background(QBColors.background)
            .navigationTitle("Appreciation")
            .onAppear {
                selectedPersonID = selectedPersonID ?? repository.people.first?.id
            }
        }
    }

    private var personPicker: some View {
        Picker("Person", selection: $selectedPersonID) {
            Text("Choose someone").tag(UUID?.none)
            ForEach(repository.people) { person in
                Text(person.name).tag(Optional(person.id))
            }
        }
        .pickerStyle(.menu)
    }

    private func textField(_ title: String, text: Binding<String>) -> some View {
        TextField(title, text: text, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .lineLimit(2...4)
    }

    private func textEditor(_ title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
            Text(title)
                .font(QBTypography.quiet)
                .foregroundStyle(QBColors.textSecondary)
            TextEditor(text: text)
                .frame(minHeight: 96)
                .padding(4)
                .background(Color(.tertiarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 8))
        }
    }

    private var timeline: some View {
        QBSectionCard(title: "Recent appreciation", subtitle: "A private timeline of moments worth keeping.") {
            if repository.appreciationEntries.isEmpty {
                QBEmptyStateView(
                    systemImage: "heart.text.square",
                    title: "Your timeline is waiting softly",
                    message: "No streaks. No pressure. Just memories when they arrive."
                )
            } else {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    ForEach(repository.appreciationEntries) { entry in
                        VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                            Text(personName(for: entry.personID))
                                .font(QBTypography.body.weight(.semibold))
                            Text(entry.appreciationNote)
                                .font(QBTypography.body)
                            Text(DateFormatting.shortDate.string(from: entry.date))
                                .font(QBTypography.quiet)
                                .foregroundStyle(QBColors.textSecondary)
                        }
                        Divider()
                    }
                }
            }
        }
    }

    private func saveEntry() async {
        guard let selectedPersonID else { return }
        let entry = AppreciationEntry(
            personID: selectedPersonID,
            appreciationNote: appreciationNote,
            memoryStory: memoryStory,
            whyTheyMatterToday: whyTheyMatterToday,
            mood: Mood(kind: .grateful, intensity: 3)
        )
        try? await repository.saveAppreciationEntry(entry)
        appreciationNote = ""
        memoryStory = ""
        whyTheyMatterToday = ""
    }

    private func personName(for id: UUID) -> String {
        repository.people.first(where: { $0.id == id })?.name ?? "Someone important"
    }
}

#Preview {
    AppreciationEntryView()
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

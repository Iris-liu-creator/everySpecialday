import SwiftUI

struct ReflectionMoodView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    @State private var selectedMood: MoodKind = .peaceful
    @State private var energy = 3.0
    @State private var calmness = 4.0
    @State private var reflection = ""

    private let question = SpiritQuestion(prompt: "What is asking for your attention with kindness today?")

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    QBSectionCard(title: "Question to the spirit", subtitle: question.prompt) {
                        Text("Answer lightly. A fragment still counts.")
                            .font(QBTypography.quiet)
                            .foregroundStyle(QBColors.textSecondary)
                    }

                    QBSectionCard(title: "Mood", subtitle: "Choose the closest word, not the perfect one.") {
                        moodGrid
                        Slider(value: $energy, in: 1...5, step: 1) {
                            Text("Energy")
                        } minimumValueLabel: {
                            Image(systemName: "moon")
                        } maximumValueLabel: {
                            Image(systemName: "sun.max")
                        }
                        Slider(value: $calmness, in: 1...5, step: 1) {
                            Text("Calmness")
                        } minimumValueLabel: {
                            Image(systemName: "wind")
                        } maximumValueLabel: {
                            Image(systemName: "leaf")
                        }
                    }

                    QBSectionCard(title: "Reflection", subtitle: "A few words for the day you actually had.") {
                        TextEditor(text: $reflection)
                            .frame(minHeight: 120)
                            .padding(4)
                            .background(Color(.tertiarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 8))

                        Button {
                            Task { await saveReflection() }
                        } label: {
                            Label("Save reflection", systemImage: "square.and.pencil")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(QBColors.accent)
                        .disabled(reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }

                    previousReflections
                }
                .padding(QBSpacing.medium)
            }
            .background(QBColors.background)
            .navigationTitle("Reflect")
        }
    }

    private var moodGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: QBSpacing.small)], spacing: QBSpacing.small) {
            ForEach(MoodKind.allCases, id: \.self) { mood in
                Button {
                    selectedMood = mood
                } label: {
                    Label(mood.label, systemImage: mood.symbol)
                        .font(QBTypography.quiet)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(selectedMood == mood ? QBColors.accent : QBColors.sage)
            }
        }
    }

    private var previousReflections: some View {
        QBSectionCard(title: "Previous reflections") {
            if repository.reflections.isEmpty {
                QBEmptyStateView(
                    systemImage: "moon.stars",
                    title: "Nothing needs to be forced",
                    message: "When you are ready, a reflection can be one sentence."
                )
            } else {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    ForEach(repository.reflections) { entry in
                        VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                            Label(entry.mood.kind.label, systemImage: entry.mood.kind.symbol)
                                .font(QBTypography.body.weight(.semibold))
                            Text(entry.reflection)
                                .font(QBTypography.quiet)
                                .foregroundStyle(QBColors.textSecondary)
                        }
                        Divider()
                    }
                }
            }
        }
    }

    private func saveReflection() async {
        let entry = ReflectionEntry(
            mood: Mood(kind: selectedMood, intensity: 3),
            energy: Int(energy),
            calmness: Int(calmness),
            reflection: reflection,
            spiritQuestion: question
        )
        try? await repository.saveReflection(entry)
        reflection = ""
    }
}

#Preview {
    ReflectionMoodView()
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

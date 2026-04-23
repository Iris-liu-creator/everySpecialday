import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    header
                    promptCard
                    moodCard
                    goalCard
                    chatCard
                }
                .padding(QBSpacing.medium)
            }
            .background(QBColors.background)
            .navigationTitle("QuietBloom")
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: QBSpacing.small) {
            Text("Today")
                .font(QBTypography.eyebrow)
                .foregroundStyle(QBColors.clay)
                .textCase(.uppercase)

            Text("Notice one person, one feeling, and one small next step.")
                .font(.title3.weight(.semibold))
                .foregroundStyle(QBColors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, QBSpacing.small)
    }

    private var promptCard: some View {
        QBSectionCard(
            title: "Daily appreciation",
            subtitle: "Who made life feel lighter today?"
        ) {
            if let entry = repository.appreciationEntries.first,
               let person = repository.people.first(where: { $0.id == entry.personID }) {
                VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                    Text(person.name)
                        .font(QBTypography.body.weight(.semibold))
                    Text(entry.appreciationNote)
                        .font(QBTypography.body)
                        .foregroundStyle(QBColors.textSecondary)
                }
            } else {
                QBEmptyStateView(
                    systemImage: "heart",
                    title: "A small appreciation can live here",
                    message: "Start with one name and one honest sentence."
                )
            }
        }
    }

    private var moodCard: some View {
        QBSectionCard(title: "Mood check-in", subtitle: "No fixing required. Just noticing.") {
            if let reflection = repository.reflections.first {
                Label(reflection.mood.kind.label, systemImage: reflection.mood.kind.symbol)
                    .font(QBTypography.body)
                    .foregroundStyle(QBColors.textPrimary)
                Text(reflection.reflection)
                    .font(QBTypography.quiet)
                    .foregroundStyle(QBColors.textSecondary)
            } else {
                Text("How is your inner weather today?")
                    .font(QBTypography.body)
            }
        }
    }

    private var goalCard: some View {
        QBSectionCard(title: "Meaningful goal", subtitle: "Progress that still remembers why.") {
            if let goal = repository.goals.first {
                VStack(alignment: .leading, spacing: QBSpacing.small) {
                    Text(goal.title)
                        .font(QBTypography.body.weight(.semibold))
                    ProgressView(value: goal.progress)
                        .tint(QBColors.sage)
                    Text(goal.meaning)
                        .font(QBTypography.quiet)
                        .foregroundStyle(QBColors.textSecondary)
                }
            } else {
                Text("A future goal can begin as a value, not a task list.")
                    .font(QBTypography.quiet)
                    .foregroundStyle(QBColors.textSecondary)
            }
        }
    }

    private var chatCard: some View {
        QBSectionCard(title: "AI companion", subtitle: repository.privacySettings.defaultChatMode.privacySummary) {
            Label(repository.privacySettings.defaultChatMode.displayName, systemImage: "lock.shield")
                .font(QBTypography.body)
                .foregroundStyle(QBColors.textPrimary)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

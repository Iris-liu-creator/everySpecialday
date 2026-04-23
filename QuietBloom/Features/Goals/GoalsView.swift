import SwiftUI

struct GoalsView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: QBSpacing.medium) {
                    QBSectionCard(
                        title: "Goals with meaning",
                        subtitle: "A yearly direction can stay connected to the life underneath it."
                    ) {
                        Text("Future milestones will support monthly reflection and daily actions without turning care into pressure.")
                            .font(QBTypography.quiet)
                            .foregroundStyle(QBColors.textSecondary)
                    }

                    if repository.goals.isEmpty {
                        QBEmptyStateView(
                            systemImage: "target",
                            title: "A meaningful goal can start quietly",
                            message: "Name what matters before deciding what to measure."
                        )
                    } else {
                        ForEach(repository.goals) { goal in
                            goalCard(goal)
                        }
                    }
                }
                .padding(QBSpacing.medium)
            }
            .background(QBColors.background)
            .navigationTitle("Goals")
            .toolbar {
                Button {
                    // Goal creation flow belongs in the next feature milestone.
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add goal")
            }
        }
    }

    private func goalCard(_ goal: Goal) -> some View {
        QBSectionCard(title: goal.title, subtitle: goal.meaning) {
            VStack(alignment: .leading, spacing: QBSpacing.medium) {
                ProgressView(value: goal.progress)
                    .tint(QBColors.sage)
                    .accessibilityLabel("Goal progress")

                Text("\(goal.year) · \(goal.status.displayName)")
                    .font(QBTypography.quiet)
                    .foregroundStyle(QBColors.textSecondary)

                ForEach(goal.milestones) { milestone in
                    VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                        Text("\(DateFormatting.monthName(milestone.month)): \(milestone.title)")
                            .font(QBTypography.body.weight(.semibold))
                        Text(milestone.status.displayName)
                            .font(QBTypography.quiet)
                            .foregroundStyle(QBColors.textSecondary)

                        ForEach(milestone.dailyActions) { action in
                            Label(action.title, systemImage: action.isCompleted ? "checkmark.circle.fill" : "circle")
                                .font(QBTypography.quiet)
                                .foregroundStyle(action.isCompleted ? QBColors.sage : QBColors.textSecondary)
                        }
                    }
                    .padding(.vertical, QBSpacing.xSmall)
                }
            }
        }
    }
}

#Preview {
    GoalsView()
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

import SwiftUI

struct LovedOnesView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    var body: some View {
        NavigationStack {
            List {
                if repository.people.isEmpty {
                    QBEmptyStateView(
                        systemImage: "person.2",
                        title: "The people who matter can gather here",
                        message: "Add loved ones, mentors, family, friends, or anyone your heart returns to."
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                } else {
                    Section("Important people") {
                        ForEach(repository.people) { person in
                            VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                                Text(person.name)
                                    .font(QBTypography.body.weight(.semibold))
                                Text(person.relationship.displayName)
                                    .font(QBTypography.quiet)
                                    .foregroundStyle(QBColors.textSecondary)
                                if !person.notes.isEmpty {
                                    Text(person.notes)
                                        .font(QBTypography.quiet)
                                        .foregroundStyle(QBColors.textSecondary)
                                }
                            }
                            .padding(.vertical, QBSpacing.xSmall)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(QBColors.background)
            .navigationTitle("Loved Ones")
            .toolbar {
                Button {
                    // Creation flow lands in a later milestone.
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add loved one")
            }
        }
    }
}

#Preview {
    LovedOnesView()
        .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

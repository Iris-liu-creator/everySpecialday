import Foundation

struct Goal: Identifiable, Codable, Hashable {
    var id: UUID
    var title: String
    var year: Int
    var meaning: String
    var status: GoalStatus
    var milestones: [MonthlyMilestone]
    var createdAt: Date

    var progress: Double {
        let actions = milestones.flatMap(\.dailyActions)
        guard !actions.isEmpty else { return 0 }
        let completed = actions.filter(\.isCompleted).count
        return Double(completed) / Double(actions.count)
    }

    init(
        id: UUID = UUID(),
        title: String,
        year: Int,
        meaning: String,
        status: GoalStatus = .active,
        milestones: [MonthlyMilestone] = [],
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.year = year
        self.meaning = meaning
        self.status = status
        self.milestones = milestones
        self.createdAt = createdAt
    }
}

enum GoalStatus: String, CaseIterable, Codable, Hashable {
    case active
    case paused
    case completed
    case archived

    var displayName: String {
        switch self {
        case .active: "Active"
        case .paused: "Paused"
        case .completed: "Completed"
        case .archived: "Archived"
        }
    }
}

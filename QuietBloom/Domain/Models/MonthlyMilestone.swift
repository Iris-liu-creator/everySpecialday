import Foundation

struct MonthlyMilestone: Identifiable, Codable, Hashable {
    var id: UUID
    var goalID: UUID
    var month: Int
    var title: String
    var reflection: String
    var status: MilestoneStatus
    var dailyActions: [DailyAction]

    init(
        id: UUID = UUID(),
        goalID: UUID,
        month: Int,
        title: String,
        reflection: String = "",
        status: MilestoneStatus = .notStarted,
        dailyActions: [DailyAction] = []
    ) {
        self.id = id
        self.goalID = goalID
        self.month = min(max(month, 1), 12)
        self.title = title
        self.reflection = reflection
        self.status = status
        self.dailyActions = dailyActions
    }
}

enum MilestoneStatus: String, CaseIterable, Codable, Hashable {
    case notStarted
    case inProgress
    case paused
    case completed

    var displayName: String {
        switch self {
        case .notStarted: "Not started"
        case .inProgress: "In progress"
        case .paused: "Paused"
        case .completed: "Completed"
        }
    }
}

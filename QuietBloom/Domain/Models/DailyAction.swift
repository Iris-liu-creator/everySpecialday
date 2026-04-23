import Foundation

struct DailyAction: Identifiable, Codable, Hashable {
    var id: UUID
    var milestoneID: UUID
    var title: String
    var targetDate: Date
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        milestoneID: UUID,
        title: String,
        targetDate: Date = .now,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.milestoneID = milestoneID
        self.title = title
        self.targetDate = targetDate
        self.isCompleted = isCompleted
    }
}

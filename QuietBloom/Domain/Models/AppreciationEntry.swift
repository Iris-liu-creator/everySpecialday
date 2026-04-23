import Foundation

struct AppreciationEntry: Identifiable, Codable, Hashable {
    var id: UUID
    var personID: UUID
    var date: Date
    var appreciationNote: String
    var memoryStory: String
    var whyTheyMatterToday: String
    var mood: Mood?
    var tags: [String]
    var reconnectReminder: ReconnectReminder?

    init(
        id: UUID = UUID(),
        personID: UUID,
        date: Date = .now,
        appreciationNote: String,
        memoryStory: String = "",
        whyTheyMatterToday: String = "",
        mood: Mood? = nil,
        tags: [String] = [],
        reconnectReminder: ReconnectReminder? = nil
    ) {
        self.id = id
        self.personID = personID
        self.date = date
        self.appreciationNote = appreciationNote
        self.memoryStory = memoryStory
        self.whyTheyMatterToday = whyTheyMatterToday
        self.mood = mood
        self.tags = tags
        self.reconnectReminder = reconnectReminder
    }
}

struct ReconnectReminder: Identifiable, Codable, Hashable {
    var id: UUID
    var date: Date
    var note: String
    var isEnabled: Bool

    init(id: UUID = UUID(), date: Date, note: String, isEnabled: Bool = true) {
        self.id = id
        self.date = date
        self.note = note
        self.isEnabled = isEnabled
    }
}

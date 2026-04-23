import Foundation

struct ChatMessage: Identifiable, Codable, Hashable {
    var id: UUID
    var role: ChatRole
    var text: String
    var timestamp: Date
    var safetySignal: ChatSafetySignal

    init(
        id: UUID = UUID(),
        role: ChatRole,
        text: String,
        timestamp: Date = .now,
        safetySignal: ChatSafetySignal = .none
    ) {
        self.id = id
        self.role = role
        self.text = text
        self.timestamp = timestamp
        self.safetySignal = safetySignal
    }
}

enum ChatRole: String, Codable, Hashable {
    case user
    case assistant
    case system
}

enum ChatSafetySignal: String, Codable, Hashable {
    case none
    case needsGentleBoundary
    case crisisSupportRequired
}

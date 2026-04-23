import Foundation

struct ChatSession: Identifiable, Codable, Hashable {
    var id: UUID
    var mode: AIChatMode
    var startedAt: Date
    var messages: [ChatMessage]
    var localSummary: String?

    init(
        id: UUID = UUID(),
        mode: AIChatMode,
        startedAt: Date = .now,
        messages: [ChatMessage] = [],
        localSummary: String? = nil
    ) {
        self.id = id
        self.mode = mode
        self.startedAt = startedAt
        self.messages = messages
        self.localSummary = localSummary
    }
}

enum AIChatMode: String, CaseIterable, Codable, Hashable {
    case memory
    case noMemory

    var displayName: String {
        switch self {
        case .memory: "Memory Mode"
        case .noMemory: "No Memory Mode"
        }
    }

    var privacySummary: String {
        switch self {
        case .memory:
            "Uses selected local context from reflections, goals, and appreciation entries."
        case .noMemory:
            "Keeps the conversation temporary and does not use saved personal context."
        }
    }
}

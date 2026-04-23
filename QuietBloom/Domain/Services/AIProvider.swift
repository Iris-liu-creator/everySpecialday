import Foundation

protocol AIProvider {
    func sendMessage(_ request: AIChatRequest) async throws -> AIChatResponse
}

struct AIChatRequest: Codable, Hashable {
    var mode: AIChatMode
    var userMessage: String
    var conversation: [ChatMessage]
    var memoryContext: AIMemoryContext?
}

struct AIMemoryContext: Codable, Hashable {
    var recentReflections: [ReflectionEntry]
    var recentAppreciationEntries: [AppreciationEntry]
    var activeGoals: [Goal]
}

struct AIChatResponse: Codable, Hashable {
    var message: ChatMessage
    var usedMemoryContext: Bool
    var providerDescription: String
}

enum AIProviderError: Error, LocalizedError {
    case unavailableInMVP

    var errorDescription: String? {
        "AI generation is stubbed in this MVP. Add a local, self-hosted, or cloud provider behind AIProvider later."
    }
}

struct StubAIProvider: AIProvider {
    func sendMessage(_ request: AIChatRequest) async throws -> AIChatResponse {
        let prefix = request.mode == .memory
            ? "Memory Mode stub:"
            : "No Memory Mode stub:"
        let text = "\(prefix) I can hold space for this in the interface, but real AI responses are intentionally not implemented yet."

        return AIChatResponse(
            message: ChatMessage(role: .assistant, text: text),
            usedMemoryContext: request.mode == .memory && request.memoryContext != nil,
            providerDescription: "MVP stub provider"
        )
    }
}

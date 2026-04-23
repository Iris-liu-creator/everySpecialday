import Foundation

@MainActor
protocol StorageService {
    func fetchPeople() async throws -> [ImportantPerson]
    func savePerson(_ person: ImportantPerson) async throws
    func deletePerson(id: UUID) async throws

    func fetchAppreciationEntries() async throws -> [AppreciationEntry]
    func saveAppreciationEntry(_ entry: AppreciationEntry) async throws
    func deleteAppreciationEntry(id: UUID) async throws

    func fetchReflections() async throws -> [ReflectionEntry]
    func saveReflection(_ reflection: ReflectionEntry) async throws
    func deleteReflection(id: UUID) async throws

    func fetchGoals() async throws -> [Goal]
    func saveGoal(_ goal: Goal) async throws
    func deleteGoal(id: UUID) async throws

    func fetchChatSessions() async throws -> [ChatSession]
    func saveChatSession(_ session: ChatSession) async throws
    func deleteChatSession(id: UUID) async throws

    func fetchPrivacySettings() async throws -> PrivacySettings
    func savePrivacySettings(_ settings: PrivacySettings) async throws
    func deleteAllLocalData() async throws
}

enum StorageError: Error, LocalizedError {
    case itemNotFound
    case unavailableInStub

    var errorDescription: String? {
        switch self {
        case .itemNotFound: "The requested item could not be found."
        case .unavailableInStub: "This storage action is not implemented in the MVP stub."
        }
    }
}

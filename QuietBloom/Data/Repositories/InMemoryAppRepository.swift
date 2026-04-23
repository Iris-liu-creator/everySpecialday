import Combine
import Foundation

@MainActor
final class InMemoryAppRepository: ObservableObject, AppRepository {
    @Published private(set) var people: [ImportantPerson]
    @Published private(set) var appreciationEntries: [AppreciationEntry]
    @Published private(set) var reflections: [ReflectionEntry]
    @Published private(set) var goals: [Goal]
    @Published private(set) var chatSessions: [ChatSession]
    @Published private(set) var privacySettings: PrivacySettings

    init(sampleData: SampleData = .empty) {
        people = sampleData.people
        appreciationEntries = sampleData.appreciationEntries
        reflections = sampleData.reflections
        goals = sampleData.goals
        chatSessions = sampleData.chatSessions
        privacySettings = sampleData.privacySettings
    }

    func fetchPeople() async throws -> [ImportantPerson] {
        people
    }

    func savePerson(_ person: ImportantPerson) async throws {
        upsert(person, in: &people)
    }

    func deletePerson(id: UUID) async throws {
        people.removeAll { $0.id == id }
    }

    func fetchAppreciationEntries() async throws -> [AppreciationEntry] {
        appreciationEntries
    }

    func saveAppreciationEntry(_ entry: AppreciationEntry) async throws {
        upsert(entry, in: &appreciationEntries)
    }

    func deleteAppreciationEntry(id: UUID) async throws {
        appreciationEntries.removeAll { $0.id == id }
    }

    func fetchReflections() async throws -> [ReflectionEntry] {
        reflections
    }

    func saveReflection(_ reflection: ReflectionEntry) async throws {
        upsert(reflection, in: &reflections)
    }

    func deleteReflection(id: UUID) async throws {
        reflections.removeAll { $0.id == id }
    }

    func fetchGoals() async throws -> [Goal] {
        goals
    }

    func saveGoal(_ goal: Goal) async throws {
        upsert(goal, in: &goals)
    }

    func deleteGoal(id: UUID) async throws {
        goals.removeAll { $0.id == id }
    }

    func fetchChatSessions() async throws -> [ChatSession] {
        chatSessions
    }

    func saveChatSession(_ session: ChatSession) async throws {
        upsert(session, in: &chatSessions)
    }

    func deleteChatSession(id: UUID) async throws {
        chatSessions.removeAll { $0.id == id }
    }

    func fetchPrivacySettings() async throws -> PrivacySettings {
        privacySettings
    }

    func savePrivacySettings(_ settings: PrivacySettings) async throws {
        privacySettings = settings
    }

    func deleteAllLocalData() async throws {
        people = []
        appreciationEntries = []
        reflections = []
        goals = []
        chatSessions = []
        privacySettings = .default
    }

    private func upsert<T: Identifiable>(_ item: T, in collection: inout [T]) where T.ID == UUID {
        if let index = collection.firstIndex(where: { $0.id == item.id }) {
            collection[index] = item
        } else {
            collection.insert(item, at: 0)
        }
    }
}

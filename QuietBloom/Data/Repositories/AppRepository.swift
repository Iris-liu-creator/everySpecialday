import Foundation

@MainActor
protocol AppRepository: StorageService {
    var people: [ImportantPerson] { get }
    var appreciationEntries: [AppreciationEntry] { get }
    var reflections: [ReflectionEntry] { get }
    var goals: [Goal] { get }
    var chatSessions: [ChatSession] { get }
    var privacySettings: PrivacySettings { get }
}

import Foundation

protocol NotificationService {
    func requestAuthorization() async -> NotificationAuthorizationStatus
    func scheduleReminder(_ reminder: LocalReminder) async throws
    func cancelReminder(id: UUID) async
}

struct LocalReminder: Identifiable, Codable, Hashable {
    var id: UUID
    var title: String
    var body: String
    var date: Date
    var kind: ReminderKind

    init(id: UUID = UUID(), title: String, body: String, date: Date, kind: ReminderKind) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.kind = kind
    }
}

enum ReminderKind: String, Codable, Hashable {
    case appreciation
    case reflection
    case goal
    case reconnect
}

enum NotificationAuthorizationStatus: String, Codable, Hashable {
    case notDetermined
    case authorized
    case denied
    case stubbed
}

struct StubNotificationService: NotificationService {
    func requestAuthorization() async -> NotificationAuthorizationStatus {
        .stubbed
    }

    func scheduleReminder(_ reminder: LocalReminder) async throws {
        // Real local notification scheduling belongs in a later milestone.
    }

    func cancelReminder(id: UUID) async {
        // No-op in MVP.
    }
}

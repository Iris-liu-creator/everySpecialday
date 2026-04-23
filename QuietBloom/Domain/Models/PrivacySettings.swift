import Foundation

struct PrivacySettings: Codable, Hashable {
    var isAppLockEnabled: Bool
    var defaultChatMode: AIChatMode
    var allowsMemoryMode: Bool
    var allowsLocalNotifications: Bool
    var hasCompletedPrivacyOnboarding: Bool

    static let `default` = PrivacySettings(
        isAppLockEnabled: false,
        defaultChatMode: .noMemory,
        allowsMemoryMode: true,
        allowsLocalNotifications: false,
        hasCompletedPrivacyOnboarding: false
    )
}

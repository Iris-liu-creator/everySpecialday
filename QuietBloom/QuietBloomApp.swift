import SwiftUI

@main
struct QuietBloomApp: App {
    @StateObject private var repository = InMemoryAppRepository(sampleData: .preview)
    private let aiProvider: AIProvider = StubAIProvider()
    private let notificationService: NotificationService = StubNotificationService()
    private let biometricAuthService: BiometricAuthService = StubBiometricAuthService()

    var body: some Scene {
        WindowGroup {
            RootView(
                aiProvider: aiProvider,
                notificationService: notificationService,
                biometricAuthService: biometricAuthService
            )
            .environmentObject(repository)
        }
    }
}

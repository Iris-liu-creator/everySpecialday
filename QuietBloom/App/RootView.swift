import SwiftUI

struct RootView: View {
    let aiProvider: AIProvider
    let notificationService: NotificationService
    let biometricAuthService: BiometricAuthService

    @State private var selectedTab: AppTab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem { Label(AppTab.home.title, systemImage: AppTab.home.systemImage) }
                .tag(AppTab.home)

            LovedOnesView()
                .tabItem { Label(AppTab.lovedOnes.title, systemImage: AppTab.lovedOnes.systemImage) }
                .tag(AppTab.lovedOnes)

            AppreciationEntryView()
                .tabItem { Label(AppTab.appreciation.title, systemImage: AppTab.appreciation.systemImage) }
                .tag(AppTab.appreciation)

            ReflectionMoodView()
                .tabItem { Label(AppTab.reflection.title, systemImage: AppTab.reflection.systemImage) }
                .tag(AppTab.reflection)

            GoalsView()
                .tabItem { Label(AppTab.goals.title, systemImage: AppTab.goals.systemImage) }
                .tag(AppTab.goals)

            AIChatView(aiProvider: aiProvider)
                .tabItem { Label(AppTab.chat.title, systemImage: AppTab.chat.systemImage) }
                .tag(AppTab.chat)

            SettingsView(
                notificationService: notificationService,
                biometricAuthService: biometricAuthService
            )
            .tabItem { Label(AppTab.settings.title, systemImage: AppTab.settings.systemImage) }
            .tag(AppTab.settings)
        }
        .tint(QBColors.accent)
    }
}

#Preview {
    RootView(
        aiProvider: StubAIProvider(),
        notificationService: StubNotificationService(),
        biometricAuthService: StubBiometricAuthService()
    )
    .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var repository: InMemoryAppRepository

    let notificationService: NotificationService
    let biometricAuthService: BiometricAuthService

    @State private var notificationStatus: NotificationAuthorizationStatus = .notDetermined
    @State private var biometricAvailability: BiometricAvailability = .unavailable

    var body: some View {
        NavigationStack {
            List {
                privacySection
                aiSection
                dataSection
                stubSection
            }
            .scrollContentBackground(.hidden)
            .background(QBColors.background)
            .navigationTitle("Settings")
            .task {
                notificationStatus = await notificationService.requestAuthorization()
                biometricAvailability = await biometricAuthService.availability()
            }
        }
    }

    private var privacySection: some View {
        Section("Privacy and security") {
            Label(
                repository.privacySettings.isAppLockEnabled ? "App lock enabled" : "App lock ready for setup",
                systemImage: "lock"
            )
            Label("Biometrics: \(biometricAvailability.rawValue)", systemImage: "faceid")
            Text("MVP note: real biometric lock and encrypted persistence are intentionally stubbed until the security layer is implemented.")
                .font(QBTypography.quiet)
                .foregroundStyle(QBColors.textSecondary)
        }
    }

    private var aiSection: some View {
        Section("AI memory") {
            Label(repository.privacySettings.defaultChatMode.displayName, systemImage: "lock.shield")
            Text(repository.privacySettings.defaultChatMode.privacySummary)
                .font(QBTypography.quiet)
                .foregroundStyle(QBColors.textSecondary)
        }
    }

    private var dataSection: some View {
        Section("Your data") {
            Button {
                // Export belongs behind a real persistence layer in a later milestone.
            } label: {
                Label("Export local data", systemImage: "square.and.arrow.up")
            }

            Button(role: .destructive) {
                Task { try? await repository.deleteAllLocalData() }
            } label: {
                Label("Delete all local MVP data", systemImage: "trash")
            }
        }
    }

    private var stubSection: some View {
        Section("Reminders") {
            Label("Notifications: \(notificationStatus.rawValue)", systemImage: "bell")
            Text("Gentle reminder scheduling is represented by a service protocol and stub in this milestone.")
                .font(QBTypography.quiet)
                .foregroundStyle(QBColors.textSecondary)
        }
    }
}

#Preview {
    SettingsView(
        notificationService: StubNotificationService(),
        biometricAuthService: StubBiometricAuthService()
    )
    .environmentObject(InMemoryAppRepository(sampleData: .preview))
}

import Foundation

protocol BiometricAuthService {
    func availability() async -> BiometricAvailability
    func authenticate(reason: String) async -> BiometricAuthResult
}

enum BiometricAvailability: String, Codable, Hashable {
    case available
    case unavailable
    case notConfigured
    case stubbed
}

enum BiometricAuthResult: String, Codable, Hashable {
    case unlocked
    case cancelled
    case failed
    case stubbed
}

struct StubBiometricAuthService: BiometricAuthService {
    func availability() async -> BiometricAvailability {
        .stubbed
    }

    func authenticate(reason: String) async -> BiometricAuthResult {
        .stubbed
    }
}

import Foundation

struct Mood: Identifiable, Codable, Hashable {
    var id: UUID
    var kind: MoodKind
    var intensity: Int
    var note: String?

    init(id: UUID = UUID(), kind: MoodKind, intensity: Int = 3, note: String? = nil) {
        self.id = id
        self.kind = kind
        self.intensity = min(max(intensity, 1), 5)
        self.note = note
    }
}

enum MoodKind: String, CaseIterable, Codable, Hashable {
    case peaceful
    case grateful
    case tender
    case heavy
    case hopeful
    case unsettled

    var label: String {
        switch self {
        case .peaceful: "Peaceful"
        case .grateful: "Grateful"
        case .tender: "Tender"
        case .heavy: "Heavy"
        case .hopeful: "Hopeful"
        case .unsettled: "Unsettled"
        }
    }

    var symbol: String {
        switch self {
        case .peaceful: "leaf"
        case .grateful: "heart"
        case .tender: "hands.sparkles"
        case .heavy: "cloud"
        case .hopeful: "sun.max"
        case .unsettled: "wind"
        }
    }
}

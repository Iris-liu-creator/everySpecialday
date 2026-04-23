import SwiftUI

enum AppTab: String, CaseIterable, Identifiable {
    case home
    case lovedOnes
    case appreciation
    case reflection
    case goals
    case chat
    case settings

    var id: String { rawValue }

    var title: String {
        switch self {
        case .home: "Home"
        case .lovedOnes: "Loved Ones"
        case .appreciation: "Appreciate"
        case .reflection: "Reflect"
        case .goals: "Goals"
        case .chat: "AI Chat"
        case .settings: "Settings"
        }
    }

    var systemImage: String {
        switch self {
        case .home: "house"
        case .lovedOnes: "person.2"
        case .appreciation: "heart.text.square"
        case .reflection: "moon.stars"
        case .goals: "target"
        case .chat: "bubble.left.and.bubble.right"
        case .settings: "gearshape"
        }
    }
}

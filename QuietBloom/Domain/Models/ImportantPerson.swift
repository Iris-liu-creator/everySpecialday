import Foundation

struct ImportantPerson: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var relationship: RelationshipType
    var notes: String
    var photoReference: String?
    var tags: [String]
    var importantDates: [ImportantDate]
    var createdAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        relationship: RelationshipType,
        notes: String = "",
        photoReference: String? = nil,
        tags: [String] = [],
        importantDates: [ImportantDate] = [],
        createdAt: Date = .now
    ) {
        self.id = id
        self.name = name
        self.relationship = relationship
        self.notes = notes
        self.photoReference = photoReference
        self.tags = tags
        self.importantDates = importantDates
        self.createdAt = createdAt
    }
}

enum RelationshipType: String, CaseIterable, Codable, Hashable {
    case partner
    case family
    case friend
    case mentor
    case colleague
    case community
    case other

    var displayName: String {
        switch self {
        case .partner: "Partner"
        case .family: "Family"
        case .friend: "Friend"
        case .mentor: "Mentor"
        case .colleague: "Colleague"
        case .community: "Community"
        case .other: "Other"
        }
    }
}

struct ImportantDate: Identifiable, Codable, Hashable {
    var id: UUID
    var title: String
    var date: Date
    var includesYear: Bool

    init(id: UUID = UUID(), title: String, date: Date, includesYear: Bool = true) {
        self.id = id
        self.title = title
        self.date = date
        self.includesYear = includesYear
    }
}

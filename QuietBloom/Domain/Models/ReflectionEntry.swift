import Foundation

struct ReflectionEntry: Identifiable, Codable, Hashable {
    var id: UUID
    var date: Date
    var mood: Mood
    var energy: Int
    var calmness: Int
    var reflection: String
    var spiritQuestion: SpiritQuestion

    init(
        id: UUID = UUID(),
        date: Date = .now,
        mood: Mood,
        energy: Int,
        calmness: Int,
        reflection: String,
        spiritQuestion: SpiritQuestion
    ) {
        self.id = id
        self.date = date
        self.mood = mood
        self.energy = min(max(energy, 1), 5)
        self.calmness = min(max(calmness, 1), 5)
        self.reflection = reflection
        self.spiritQuestion = spiritQuestion
    }
}

struct SpiritQuestion: Identifiable, Codable, Hashable {
    var id: UUID
    var prompt: String
    var createdAt: Date

    init(id: UUID = UUID(), prompt: String, createdAt: Date = .now) {
        self.id = id
        self.prompt = prompt
        self.createdAt = createdAt
    }
}

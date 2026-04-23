import Foundation

struct SampleData {
    var people: [ImportantPerson]
    var appreciationEntries: [AppreciationEntry]
    var reflections: [ReflectionEntry]
    var goals: [Goal]
    var chatSessions: [ChatSession]
    var privacySettings: PrivacySettings

    static let empty = SampleData(
        people: [],
        appreciationEntries: [],
        reflections: [],
        goals: [],
        chatSessions: [],
        privacySettings: .default
    )

    static let preview: SampleData = {
        let mayaID = UUID(uuidString: "22F9316D-17DA-4B19-A3BE-10E726904D5B")!
        let jonahID = UUID(uuidString: "7D2C8D71-5D85-4C8F-8C30-084187C59B61")!
        let goalID = UUID(uuidString: "E55F54A7-55C9-4C21-9060-F50885DDF8F2")!
        let milestoneID = UUID(uuidString: "5FE29746-3216-4E6B-80E0-0A1C1CCEF258")!

        let people = [
            ImportantPerson(
                id: mayaID,
                name: "Maya",
                relationship: .friend,
                notes: "The friend who notices quiet changes.",
                tags: ["grounding", "old friend"]
            ),
            ImportantPerson(
                id: jonahID,
                name: "Jonah",
                relationship: .family,
                notes: "Calls with care, even on ordinary days.",
                tags: ["family"]
            )
        ]

        let appreciationEntries = [
            AppreciationEntry(
                personID: mayaID,
                appreciationNote: "Maya made today feel less hurried.",
                memoryStory: "She sent a voice note after remembering a small thing I said last week.",
                whyTheyMatterToday: "She reminds me that attention is a kind of love.",
                mood: Mood(kind: .grateful, intensity: 4),
                tags: ["friendship"]
            )
        ]

        let question = SpiritQuestion(prompt: "What part of your life is asking for gentler attention?")
        let reflections = [
            ReflectionEntry(
                mood: Mood(kind: .peaceful, intensity: 3),
                energy: 3,
                calmness: 4,
                reflection: "I felt more present after taking the evening slowly.",
                spiritQuestion: question
            )
        ]

        let action = DailyAction(
            milestoneID: milestoneID,
            title: "Take one walk without headphones",
            isCompleted: true
        )
        let milestone = MonthlyMilestone(
            id: milestoneID,
            goalID: goalID,
            month: 4,
            title: "Make room for slower evenings",
            reflection: "Less rushing, more noticing.",
            status: .inProgress,
            dailyActions: [action]
        )
        let goals = [
            Goal(
                id: goalID,
                title: "Live with more presence",
                year: 2026,
                meaning: "To be less absent from the people and moments I care about.",
                milestones: [milestone]
            )
        ]

        let chatSessions = [
            ChatSession(
                mode: .noMemory,
                messages: [
                    ChatMessage(role: .assistant, text: "What would feel kind to notice today?")
                ]
            )
        ]

        return SampleData(
            people: people,
            appreciationEntries: appreciationEntries,
            reflections: reflections,
            goals: goals,
            chatSessions: chatSessions,
            privacySettings: PrivacySettings(
                isAppLockEnabled: false,
                defaultChatMode: .noMemory,
                allowsMemoryMode: true,
                allowsLocalNotifications: false,
                hasCompletedPrivacyOnboarding: false
            )
        )
    }()
}

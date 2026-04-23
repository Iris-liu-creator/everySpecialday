Act as a senior iOS product strategist, UX designer, SwiftUI engineer, and privacy-first AI architect. Help me design and build a native iOS app called “QuietBloom” (working title). Make grounded assumptions where details are missing and proceed without getting stuck in unnecessary questions.

APP MISSION
Create a deeply personal, calming iOS app that reminds users of the beauty of life and the importance of the people around them. The app should feel like a private sanctuary for gratitude, reflection, purpose, and supportive conversation. It must feel warm, elegant, safe, emotionally intelligent, and human — not like a generic productivity app.

CORE PURPOSE
The main experience is a daily appreciation safe space where users can privately appreciate their loved ones and the people who matter most to them. The app should help users notice meaningful moments, reflect on relationships, and reconnect with what matters in life.

MAIN FEATURE
1. Daily Appreciation Space
- Let users create a daily appreciation entry about a loved one or important person.
- Each entry can include:
  - person’s name
  - relationship type
  - short appreciation note
  - memory or story
  - why this person matters today
  - optional reminder to reconnect with them
  - optional photo, tags, or mood
- Show a beautiful private timeline of appreciation entries.
- Offer gentle prompts such as:
  - “Who made life feel lighter today?”
  - “Who do you appreciate but rarely say it to?”
  - “What moment with someone important deserves to be remembered?”

SIDE FEATURES
2. Daily Reflection + Mood Capture
- Include a daily journal/reflection section.
- Let users log their mood with a simple and beautiful interface, such as emoji, mood words, slider, or energy/calmness scale.
- Allow a short written reflection connected to that day’s mood.
- Show trends over time in a gentle way, without feeling clinical or overly analytical.

3. “Question to the Spirit”
- Add one thoughtful daily question generated or selected by the system.
- This question should help busy modern people pause and reflect on their lives, emotions, values, and current situations.
- It should feel soulful, introspective, and grounding.
- Example prompts:
  - “What is your heart trying to tell you today?”
  - “What are you holding onto that no longer serves you?”
  - “What would bring peace to your spirit this week?”

4. Goal Setting With Meaning
- Let users set yearly goals.
- Allow each yearly goal to be broken down into monthly milestones and daily actions.
- The app should gently remind users of their progress and reconnect them to why the goal matters.
- Goals should feel value-based, not cold or purely performance-focused.
- Show progress in a motivating and calm way.
- Let users reflect on whether their goals still align with their life, values, and relationships.

5. AI Chat Companion
- Include an AI chat feature for supportive, thoughtful, emotionally intelligent conversation.
- The AI can chat based on:
  - the user’s daily reflection
  - their appreciation entries
  - their mood
  - their goals
- Add two modes:
  - Memory Mode: AI can reference relevant past reflections and goals stored privately
  - No Memory Mode: fully temporary conversation with no retained context
- The AI should feel like a calm, reliable, non-judgmental companion.
- It should ask meaningful follow-up questions, help users reflect deeply, and offer clarity and encouragement.
- It should not feel robotic, preachy, or overly cheerful.
- It should never shame the user.

6. Confidentiality, Security, and Privacy
This is a critical requirement.
- Design the app with privacy-first and local-first architecture.
- User data should be stored as securely as possible.
- Sensitive personal data should be encrypted at rest.
- Add app lock with Face ID / Touch ID / passcode.
- Include clear privacy settings and transparency around what is stored.
- Include export and permanent delete options for all personal data.
- No selling, sharing, or unnecessary external transmission of personal information.
- No invasive analytics.
- Prefer no mandatory account creation for MVP.
- Prefer on-device storage and optional private sync only if needed.
- For AI:
  - prefer local AI or self-hosted AI if feasible
  - if cloud AI is used, isolate it behind a provider layer and minimize data sharing
  - make privacy-preserving behavior the default
  - clearly separate Memory Mode from No Memory Mode

DESIGN DIRECTION
- Calm, minimal, beautiful, emotionally safe
- Soft, elegant visual language
- Meaningful whitespace and refined typography
- Warm but understated tone
- No loud gamification
- No ads
- No social feed
- Focus on stillness, reflection, and connection
- Support both light mode and dark mode
- Follow Apple-quality interaction patterns
- Accessibility must be strong: Dynamic Type, VoiceOver, contrast, tap targets, and motion sensitivity support

USER EXPERIENCE PRINCIPLES
- The app should help the user notice:
  - one person
  - one feeling
  - one meaningful question
  - one small next step
- The experience should feel supportive, not demanding
- Reminders should be gentle and encouraging, never guilt-based
- Empty states should feel comforting and hopeful
- Insights should feel reflective, not clinical

CORE SCREENS TO DESIGN
1. Onboarding
- App mission
- privacy explanation
- permission choices
- choose reminder preferences
- choose Memory Mode default for AI
- optional setup of first yearly goal

2. Home Dashboard
- today’s appreciation prompt
- mood check-in
- today’s “Question to the Spirit”
- goal progress snapshot
- quick access to AI chat

3. Loved Ones / Important People
- list of people important to the user
- relationship categories
- ability to add/edit/delete profiles
- view past appreciation entries by person

4. Appreciation Entry Screen
- write entry
- choose person
- add memory / gratitude / reminder
- save privately

5. Reflection + Mood Journal
- log mood
- write daily reflection
- browse previous reflections

6. Goals Screen
- yearly goals
- monthly milestones
- daily actions
- progress tracking
- reflective goal review

7. AI Chat Screen
- Memory Mode / No Memory Mode toggle
- privacy explanation
- warm chat interface
- optional prompts to begin deeper conversations

8. Insights / History
- appreciation streaks or rhythm
- mood patterns
- goal progress
- reflective summaries
- all presented gently and beautifully

9. Settings / Privacy / Security
- biometric lock
- export data
- delete data
- reminder settings
- AI memory controls
- privacy explanation

TECHNICAL REQUIREMENTS
- Build as a native iOS app using SwiftUI
- Use a clean, modular architecture such as MVVM or Clean Architecture
- Make the app offline-first where possible
- Use local persistence for journal entries, mood logs, goals, and loved-one profiles
- Use secure storage for sensitive settings, tokens, and secrets
- Build the AI integration behind a swappable interface so it can support:
  - on-device model
  - self-hosted/local model
  - secure cloud provider
- Include local notification support for daily appreciation, reflection, and goal reminders
- Make the code clean, maintainable, well-structured, and production-minded
- Include preview/sample data for development

SUGGESTED DATA MODELS
- UserProfile
- ImportantPerson
- AppreciationEntry
- ReflectionEntry
- MoodEntry
- SpiritQuestion
- Goal
- MonthlyMilestone
- DailyAction
- ChatSession
- ChatMessage
- AIMemoryPreference
- PrivacySetting
- ReminderSetting

AI SAFETY BEHAVIOR
- The AI must not present itself as a therapist, doctor, or emergency service
- It can be supportive, reflective, and emotionally intelligent, but should stay appropriately boundaried
- If a user expresses self-harm, suicide, or immediate crisis intent, the app should stop normal chat behavior and show an appropriate crisis support flow
- Avoid manipulative dependency language such as making the AI seem like the user’s only support

WHAT I WANT YOU TO DELIVER
Please produce the following in order:
1. A concise product brief
2. User personas and main use cases
3. Information architecture and screen map
4. Key user flows
5. Data model / schema
6. UI/UX design direction and microcopy examples
7. Technical architecture
8. Privacy and security approach
9. MVP scope vs future roadmap
10. Production-ready SwiftUI starter code for the MVP
11. Suggestions for local/self-hosted AI integration
12. App name ideas, App Store subtitle, and short description

IMPORTANT
Do not make this app feel generic. Make it feel emotionally rich, deeply private, beautifully simple, and centered on human connection, gratitude, reflection, and purpose.
Start by giving me the product brief, app structure, and screen map first, then move into the architecture and SwiftUI MVP code.

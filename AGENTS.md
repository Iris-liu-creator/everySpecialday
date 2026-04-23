# AGENTS.md

## Project overview
Build a native iOS app in SwiftUI that acts as a private sanctuary for gratitude, appreciation, reflection, meaningful goal tracking, and supportive AI conversation.

## Product priorities
1. Emotional safety
2. Privacy and confidentiality
3. Native iOS quality
4. Calm, beautiful UX
5. Maintainable architecture

## Hard constraints
- Native iOS only
- SwiftUI only
- Use a modular, production-minded architecture
- Prefer MVVM with feature-based folders
- Offline-first and local-first by default
- Do not introduce a backend unless clearly required
- Do not add analytics SDKs, ads, or social-feed behavior
- Keep AI behind protocol-based provider abstractions
- Support two chat modes: Memory Mode and No Memory Mode
- Do not make false claims about security or local AI; clearly mark any stubbed areas

## Suggested folder structure
- App/
- Features/
  - Home/
  - Appreciation/
  - Reflection/
  - Goals/
  - Chat/
  - Settings/
- Domain/
- Data/
- Services/
- DesignSystem/
- Shared/
- Docs/
- Tests/

## UX rules
- Tone must feel calm, warm, understated, and non-judgmental
- Avoid loud gamification, guilt-based reminders, and manipulative copy
- Empty states should feel gentle and hopeful
- Accessibility is required: Dynamic Type, VoiceOver labels, reduced motion support, strong contrast, large tap targets

## Privacy rules
- Prefer local storage for sensitive content
- Separate app settings, journal content, and AI memory abstractions cleanly
- Include app-lock entry points and privacy settings
- Include export and delete-all-data flows, even if MVP implementations are basic
- Memory Mode must always be explicit and user-controlled

## Engineering rules
- For large tasks, plan first before editing code
- Work in small milestones rather than trying to finish everything in one pass
- Reuse shared components where sensible
- Keep code readable and production-minded
- Add sample data and previews for major screens
- Add unit tests for core models and persistence when practical
- Keep README updated

## Validation
Before concluding a milestone:
- Build with xcodebuild
- Fix build errors before moving on
- Confirm navigation compiles
- Confirm previews/sample data work where possible
- Summarize what is complete, what is stubbed, and what remains

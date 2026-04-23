Read @docs/ProductBrief.md and @AGENTS.md.

Do not start coding immediately.

First:
1. Inspect the repository
2. Produce a concise implementation plan
3. Propose the folder structure
4. List the core data models
5. Identify risks, assumptions, and anything that should remain stubbed in MVP

Then implement only Milestone 1 and Milestone 2.

Milestone 1: App shell
- scaffold the native SwiftUI app structure
- set up feature-based folders
- add a lightweight design system foundation
- create root navigation / tab structure
- create placeholder but production-minded screens for:
  - Home
  - Loved Ones
  - Appreciation Entry
  - Reflection + Mood
  - Goals
  - AI Chat
  - Settings

Milestone 2: Core domain and local architecture
- define models for people, appreciation entries, reflections, moods, goals, milestones, daily actions, chat sessions, chat messages, and privacy settings
- create protocol-based service layers for storage, notifications, biometrics, and AI provider
- make the AI layer support Memory Mode and No Memory Mode
- add sample data and previews
- add basic local persistence abstraction
- add README notes for architecture and next milestones

Constraints:
- native iOS only
- SwiftUI only
- no backend unless necessary
- privacy-first, local-first
- no analytics SDKs
- no social features
- no third-party dependencies unless clearly justified
- do not make up fake secure/local AI implementations; use abstractions or stubs where needed

Done when:
- the app builds with xcodebuild
- all core screens compile
- the root navigation works
- sample data is visible in previews or development mode
- architecture is modular and ready for feature implementation
- final summary includes changed files, validation results, and unresolved gaps

# QuietBloom Milestones 1-2 Plan

## Summary
Build a native SwiftUI iOS starter app for `QuietBloom` with a privacy-first, local-first architecture. The MVP will include an app shell, feature-based navigation, calming placeholder screens, domain models, protocol-based service abstractions, sample data, preview support, and README architecture notes.

No implementation has been started yet. This workspace is on Windows and does not have `xcodebuild`, `swift`, or `git` available, so final Xcode validation must happen on macOS with Xcode installed.

## Implementation Plan
1. Scaffold a native iOS SwiftUI app structure with a standard app entry point, root tab navigation, and feature folders.
2. Add a lightweight design system foundation:
   - color tokens
   - typography helpers
   - spacing constants
   - reusable empty states
   - calm card/section components
3. Create production-minded placeholder screens for:
   - Home
   - Loved Ones
   - Appreciation Entry
   - Reflection + Mood
   - Goals
   - AI Chat
   - Settings
4. Define core domain models using Swift value types and stable IDs.
5. Add protocol-based service layers for:
   - local storage
   - notifications
   - biometrics/app lock
   - AI provider
6. Implement sample in-memory data and preview/dev repositories.
7. Add a basic persistence abstraction with stub/in-memory implementation for MVP.
8. Add README notes covering architecture, privacy posture, stubbed areas, and next milestones.

## Proposed Folder Structure
```text
QuietBloom/
  QuietBloomApp.swift
  App/
    RootView.swift
    AppTab.swift
  DesignSystem/
    QBColors.swift
    QBSpacing.swift
    QBTypography.swift
    Components/
      QBEmptyStateView.swift
      QBSectionCard.swift
  Domain/
    Models/
      ImportantPerson.swift
      AppreciationEntry.swift
      ReflectionEntry.swift
      Mood.swift
      Goal.swift
      MonthlyMilestone.swift
      DailyAction.swift
      ChatSession.swift
      ChatMessage.swift
      PrivacySettings.swift
    Services/
      StorageService.swift
      NotificationService.swift
      BiometricAuthService.swift
      AIProvider.swift
  Data/
    Repositories/
      AppRepository.swift
      InMemoryAppRepository.swift
    SampleData/
      SampleData.swift
  Features/
    Home/
      HomeView.swift
    LovedOnes/
      LovedOnesView.swift
    Appreciation/
      AppreciationEntryView.swift
    Reflection/
      ReflectionMoodView.swift
    Goals/
      GoalsView.swift
    Chat/
      AIChatView.swift
    Settings/
      SettingsView.swift
  Shared/
    DateFormatting.swift
  Docs/
    Architecture.md
README.md
QuietBloom.xcodeproj/
```

## Core Data Models
- `ImportantPerson`: name, relationship, notes, optional photo reference placeholder, tags, important dates.
- `AppreciationEntry`: person ID, appreciation note, memory/story, why they matter today, mood, tags, reconnect reminder flag/date.
- `ReflectionEntry`: date, mood, energy/calmness values, written reflection, daily spirit question.
- `Mood`: enum or struct representing mood label, symbol, tone, optional intensity.
- `Goal`: yearly goal, meaning/why, status, progress, milestones.
- `MonthlyMilestone`: goal ID, month, title, reflection, status.
- `DailyAction`: milestone ID, title, target date, completion state.
- `ChatSession`: mode, started date, messages, optional summary placeholder.
- `ChatMessage`: role, text, timestamp, safety classification placeholder.
- `PrivacySettings`: app lock preference, AI memory default, export/delete flags, local privacy controls.

## Public Interfaces / Architecture
- `StorageService` will expose async CRUD-style methods for people, entries, reflections, goals, chat sessions, and settings.
- `NotificationService` will expose permission request and reminder scheduling methods, implemented as a stub for MVP.
- `BiometricAuthService` will expose authentication availability and unlock methods, implemented as a stub for MVP.
- `AIProvider` will expose a chat response method that accepts `AIChatMode.memory` or `AIChatMode.noMemory`.
- Memory Mode will be explicit in the chat UI and provider request shape.
- No Memory Mode will avoid passing stored app context to the AI provider abstraction.
- MVP AI responses will be stubbed and clearly labeled as non-production.

## MVP Stubbed Areas
- Secure encrypted persistence: abstraction only; no fake security claims.
- Local AI/self-hosted/cloud AI: protocol and stub response only.
- Biometric lock: service protocol and UI entry point only.
- Notifications: protocol and placeholder implementation only.
- Export/delete all data: Settings UI affordances and service shape only.
- Photo storage: model placeholder only.
- Crisis support flow: safety model placeholder and README note only.
- Onboarding and Insights screens: out of scope for Milestones 1-2 unless represented as future README items.

## Risks And Assumptions
- Assumption: target is iOS 17+ with SwiftUI and no third-party dependencies.
- Assumption: MVVM/repository style is sufficient for MVP; no heavy Clean Architecture layering yet.
- Assumption: local-first means in-memory/sample repository now, with SwiftData or encrypted file storage considered in a later milestone.
- Risk: this Windows environment cannot validate `xcodebuild`; validation must be completed on macOS.
- Risk: hand-created Xcode project files are more fragile than generating from Xcode; implementation should keep project structure simple.
- Risk: privacy/security features must remain honest stubs until real Keychain, file protection, encryption, and LocalAuthentication work is added.

## Test And Validation Plan
- On macOS, run:
```bash
xcodebuild -project QuietBloom.xcodeproj -scheme QuietBloom -destination 'platform=iOS Simulator,name=iPhone 15' build
```
- Confirm every tab opens and each core screen compiles.
- Confirm sample data appears in previews or development UI.
- Confirm AI mode toggle changes between Memory Mode and No Memory Mode.
- Confirm README documents architecture, stubs, and next milestones.
- In this Windows workspace, validation is limited to static file inspection unless implementation is later moved to a macOS/Xcode environment.

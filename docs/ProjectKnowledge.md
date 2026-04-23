This project is a mobile app only.

Build with Expo + React Native + TypeScript using Expo Router.

Working title: QuietBloom.

Mission:
Create a calm, private sanctuary for gratitude, appreciation, reflection, purpose, and supportive conversation.

MVP scope:
- single-user
- local-first
- no login
- no cloud sync
- no remote database
- no ads
- no payments
- no social feed

Core screens:
- Home
- Important People
- Appreciation
- Reflection + Mood
- Question to the Spirit
- Goals
- AI Chat
- Settings

Core features:
- create/edit/delete important people
- daily appreciation entries linked to people
- mood capture + short reflection journal
- one spirit question per day from a local question bank
- yearly goals broken into monthly milestones and daily actions
- AI chat screen with Memory Mode and No Memory Mode
- settings with privacy explanation, reminder preferences UI, export placeholder, and working delete-all-data

AI rules:
- do not require API keys for MVP
- create a provider abstraction and a mock reflective assistant
- Memory Mode may use saved local app data
- No Memory Mode must not use saved context

Privacy rules:
- local device persistence only
- no backend unless explicitly requested later
- biometric lock may be a clearly labeled placeholder in MVP
- export may be a placeholder if needed
- delete-all-data should work

Design rules:
- calm, elegant, emotionally safe
- warm and minimal
- soft spacing, rounded cards, restrained colors
- no loud gamification
- no guilt-based streaks
- strong empty states and gentle microcopy

Engineering rules:
- keep dependencies minimal
- keep the architecture clean and feature-based
- do not ask clarifying questions; make sensible assumptions
- prioritize a believable, polished MVP over completeness
- keep the app running in Expo Go
- avoid broad rewrites in later edits; make targeted changes

# 🧠 NeuroTrack

**NeuroTrack** is a SwiftUI-based cognitive training app that helps users improve their memory and focus through a fun memory-matching game. It integrates with **Apple HealthKit** to log mindful sessions and track cognitive activity over time.

---

## 🚀 Features

- 🎮 Interactive brain-training memory match game
- 🔐 HealthKit integration for logging mindfulness sessions
- 🧘‍♀️ Tracks start and end times of cognitive sessions
- 🔄 Adaptive game logic with score tracking
- 🧩 Simple, clean SwiftUI-based interface

---

## 🛠 Tech Stack

- **Swift 5**
- **SwiftUI** – UI components
- **HealthKit** – for session logging
- **Xcode 15+** – project setup
- **Core Foundation / Foundation** – base model logic

---

## 📲 Setup & Run

### 1. Clone the Repository

```bash
git clone https://github.com/synamalhan/neurotrack.git
cd NeuroTrack
```

### 2. Open in Xcode

* Open `NeuroTrack.xcodeproj` or `NeuroTrack.xcworkspace` in **Xcode 15+**
* Ensure you're running on a **real iPhone device** (HealthKit writes may not work on simulator)

### 3. Build & Run

* Select a target device
* Press **Cmd + R** to build and run

---

## 🔐 HealthKit Permissions

To log mindfulness sessions, **NeuroTrack** requests permission to write:

* `HKCategoryTypeIdentifier.mindfulSession`

You must include this in your `Info.plist`:

```xml
<key>NSHealthUpdateUsageDescription</key>
<string>NeuroTrack uses HealthKit to log your brain training sessions.</string>
```

✅ Already included in the starter project.

---

## ✨ Screenshots

| Memory Match Game                  | HealthKit Logging                         |
| ---------------------------------- | ----------------------------------------- |
| ![Game UI](./screenshots/game.png) | ![HealthKit](./screenshots/healthkit.png) |

---

## 📦 Project Structure

```
NeuroTrack/
├── NeuroTrackApp.swift          # Entry point
├── GameView.swift               # Main game view
├── GameViewModel.swift          # Game logic and score
├── GameCard.swift               # Card model
├── GridView.swift               # Custom grid renderer
├── HealthKitManager.swift       # Handles HealthKit authorization + logging
└── Info.plist                   # App configuration
```

---

## 📌 Next Features

* [ ] 🧠 Adaptive difficulty using CoreML
* [ ] 📈 Cognitive session history viewer
* [ ] ⌚ WatchOS companion for quick exercises
* [ ] ☁️ iCloud backup and sync

---

## 👩‍💻 Author

**Syna Malhan**  
[GitHub](https://github.com/synamalhan) • [Portfolio](https://yourportfolio.com) • [LinkedIn](https://linkedin.com/in/synamalhan)

---

## 📄 License

MIT License – free to use and modify. Please credit the original author.

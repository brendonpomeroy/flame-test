# Flutter Flame Platformer Game

This is a mobile + desktop platformer game built using the [Flame game engine](https://flame-engine.org/) for Flutter.  
It is based on the [official Flame Platformer Tutorial](https://docs.flame-engine.org/latest/tutorials/platformer/platformer.html), with some enhancements to make it mobile-friendly.

---

## 🚀 Features

### 📱 Mobile Controls
- On-screen **gamepad overlay** for mobile devices
    - Left / Right buttons
    - Jump button
- Automatically shows up via the Flame overlay system

### 🧠 Controller Manager
- Centralized input manager to merge inputs from:
    - Physical keyboard (for desktop/web)
    - Touch screen buttons (for mobile)
- Makes input clean and platform-independent for the player component

### 🏆 Highscore Tracking
- `HighscoreManager` stores the player’s highest score using `shared_preferences`
- High score is:
    - Persisted across sessions
    - Displayed in both **Main Menu** and **Game Over** screens

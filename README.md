# Quiz Master

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

A modern, elegant, and fully-featured **Quiz Application** built with Flutter.

---

##  Key Features

- Declarative Routing with GoRouter
- Persistent Dark/Light Theme using SharedPreferences
- Local Data Persistence (Total Attempts, Highest Score, Last Score)
- Interactive Quiz with Progress Indicator
- Multiple Categories: Sports, Science, Technology, History, General Knowledge
- Real-time Statistics on Home Dashboard
- Clean & Modular Code Structure

---

##  Tech Stack

- **Framework**: Flutter (Dart)
- **Routing**: GoRouter
- **State Management**: Provider + ChangeNotifier
- **Local Storage**: SharedPreferences
- **Typography**: Google Fonts (Poppins)

---

lib/
├── main.dart                     # Entry point of the application
│
├── core/                         # Core utilities and configurations
│   ├── constants.dart            # App constants and SharedPreferences keys
│   ├── router.dart               # GoRouter configuration and routes
│   └── theme_provider.dart       # Theme management with persistence
│
├── models/                       # Data models
│   ├── quiz_model.dart           # QuizQuestion model class
│   └── user_stats.dart           # User statistics model (optional)
│
├── screens/                      # All UI screens
│   ├── home_screen.dart          # Dashboard with statistics and categories
│   ├── quiz_screen.dart          # Main quiz interface
│   └── result_screen.dart        # Result page with detailed metrics
│
├── data/                         # Local data sources
│   └── dummy_questions.dart      # Hardcoded quiz questions by category
│
├── widgets/                      # Reusable UI components
│   └── category_card.dart        # Custom category card widget
│
└── README.md                     # Project documentation

##  How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/sumaiya-akter-runa/flutter_quiz_master_app.git

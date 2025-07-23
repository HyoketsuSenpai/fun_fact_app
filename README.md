# 🧠 Fun Fact App

A simple Flutter application that fetches and displays a random fun fact from the internet. Users can refresh the screen to get a new fact, and the app ensures that facts are not repeated during the session.

## ✨ Features

* Fetches random fun facts from [uselessfacts.jsph.pl](https://uselessfacts.jsph.pl/)
* Smooth text transition animation for each new fact
* Spinning refresh button animation
* Dark and light theme support
* Basic error handling and user feedback

## 🖼️ Preview

[![Screenshot-2025-07-23-095713.png](https://i.postimg.cc/XqMT2Qt7/Screenshot-2025-07-23-095713.png)](https://postimg.cc/zbjtvSJ9)

## 📦 Dependencies

* [`http`](https://pub.dev/packages/http): for making HTTP requests

## 📁 Project Structure


```plaintext
fun_fact_app_flutter/
├── lib/
│   ├── model/
│   │   └── fact.dart                 # Fact model
│   ├── repositories/
│   │   └── fun_fact_repo.dart        # Handles API call to fetch facts
│   ├── screens/
│   │   └── home_screen.dart          # UI and animation for displaying fun facts
│   └── main.dart                     # App entry point and theme setup
├── android/                          # Android platform code
├── ios/                              # iOS platform code
├── linux/                            # Linux platform code
├── macos/                            # macOS platform code
├── windows/                          # Windows platform code
├── web/                              # Web platform code
├── pubspec.yaml                      # Flutter dependencies and asset definitions
├── pubspec.lock                      # Locked dependency versions
├── README.md                         # Project overview (this file)
├── .gitignore                        # Git ignore rules
├── CMakeLists.txt                    # CMake config for desktop builds

```

## 🔧 Getting Started

1. **Clone the repo**

```bash
git clone https://github.com/HyoketsuSenpai/fun_fact_app.git
cd fun_fact_app
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

## 🌐 API Reference

This app uses the [Useless Facts API](https://uselessfacts.jsph.pl/):

```
GET https://uselessfacts.jsph.pl/api/v2/facts/random?language=en
```

## 🧪 How it Works

* `Fact` is a model class that holds the fact text.
* `FunFactRepository` fetches a random fact using the HTTP client.
* `HomeScreen` manages UI, state, and animations for displaying the fact and reloading new ones.
* Each new fact triggers a slide animation and a rotating icon animation.
* Previously seen facts are stored to avoid repetition in a single session.

## ⚠️ Notes

* Make sure you are connected to the internet for the API to respond.
* If the API fails, a Snackbar message will notify the user.


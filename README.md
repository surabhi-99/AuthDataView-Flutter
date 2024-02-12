# AuthDataFlow Flutter Application

## Overview
**AuthDataFlow** is a Flutter application demonstrating user authentication and data display functionality. It integrates Firebase for authentication and fetches data from a public API.

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- An editor (VS Code, Android Studio, or IntelliJ IDEA)
- A Firebase project

### Setup
1. **Clone the repository** to your local machine.
2. **Navigate** to the project directory.
3. Run `flutter pub get` to **install dependencies**.
4. **Setup Firebase**:
   - Create a Firebase project in the Firebase console.
   - Add your Android/iOS app to your Firebase project.
   - Download the `google-services.json` or `GoogleService-Info.plist` and place it in the appropriate directory (`android/app` or `ios/Runner`).

### Running the App
1. Ensure an emulator or a physical device is connected.
2. Run `flutter run` in the terminal within the project directory.

## Code Documentation
- `main.dart`: Initializes the app and Firebase. Sets up the MaterialApp with the initial route based on the authentication state. Integrates `StreamBuilder` for real-time authentication state management.
- `login_screen.dart`: Manages user login using Firebase Authentication. Provides UI for email and password input.
- `registration_screen.dart`: Handles new user registration with Firebase Authentication.
- `home_screen.dart`: Displays data fetched from a public API using HTTP requests. Also allows users to sign out.
- `post.dart`, `posts_service.dart`, `posts_screen.dart`: These files are used for fetching and displaying posts from a public API. `post.dart` defines the data model, `posts_service.dart` handles the API call, and `posts_screen.dart` is the UI component that displays the posts.

## Design Decisions
- Firebase Authentication was chosen for its robustness and ease of integration, providing a secure and scalable solution for user management.
- Fetching data from a public API and displaying it within the app demonstrates how to work with external data sources in Flutter, making it a practical example for developers learning to integrate RESTful APIs.

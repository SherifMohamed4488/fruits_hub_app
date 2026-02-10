#  🍉 Fruits Hub App — Flutter Fruits E-Commerce

**Fruits Hub App** is a Flutter application for browsing and ordering fresh fruits. It follows **Clean Architecture**, uses **BLoC** for state management, integrates **Firebase Authentication** & **Firestore**, leverages **Shared Preferences**, and is fully **responsive**. The codebase is structured for **clean, maintainable, and scalable development**.

---

## 🚀 Features

- 🍎 Browse a catalog of fresh fruits  
- 🔎 Search fruits by name or category  
- 🛒 Add fruits to cart and manage quantities  
- 📄 View fruit details (images, price, description)  
- 🔐 Firebase Authentication (sign in/up)  
- 🌐 Firestore backend for products and orders  
- 💾 Shared Preferences for storing user session / settings  
- 📱 Fully responsive UI  
- ⚡ Smooth animations and reusable widgets  
- 🧩 BLoC state management with Clean Architecture  

---

## 🛠️ Tech Stack

- **Flutter & Dart** — Cross-platform development  
- **BLoC** — State management  
- **Firebase Auth & Firestore** — Backend & authentication  
- **Shared Preferences** — Local storage  
- **REST API / Firestore** — Data fetching  
- **Responsive UI** — Adapts to mobile/tablet  
- **Clean Architecture** — Layered, maintainable code
- **PayPal** — Payment gateway integration  


---



---

## 📦 Getting Started

### Prerequisites

- Flutter SDK installed  
- Android Studio / VS Code / Xcode  
- Firebase project configured  

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/SherifMohamed4488/fruits_hub_app.git
cd fruits_hub_app
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Configure Firebase**

- Add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS)  
- Enable Firestore & Authentication in your Firebase project  

4. **Run the App**

```bash
flutter run
```

---

## 🧠 Clean Architecture Folder Structure

```
lib/
├── main.dart                           # App entry point
├── main_layout.dart                    # Main layout / scaffold
├── core/                               # Shared utilities and constants
│   ├── constants/
│   │   ├── api_endpoints.dart          # API endpoints
│   │   ├── app_colors.dart             # Color palette
│   │   └── app_strings.dart            # Shared strings
│   ├── network/
│   │   ├── firebase_service.dart       # Firebase helpers
│   │   └── api_exceptions.dart         # API & Firestore error handling
│   └── utils/
│       ├── helpers.dart                # Helper functions
│       └── validators.dart             # Input validators
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   └── usecases/
│   │   │       └── login_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── auth_bloc.dart
│   │       └── view/
│   │           ├── login_view.dart
│   │           ├── signup_view.dart
│   │           └── widgets/
│   │               └── auth_form.dart
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── home_model.dart
│   │   │   └── repositories/
│   │   │       └── home_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── home_entity.dart
│   │   │   └── usecases/
│   │   │       └── get_home_data_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── home_bloc.dart
│   │       └── view/
│   │           ├── home_view.dart
│   │           └── widgets/
│   │               └── home_widgets.dart
│   ├── best_selling/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── best_selling_model.dart
│   │   │   └── repositories/
│   │   │       └── best_selling_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── best_selling_entity.dart
│   │   │   └── usecases/
│   │   │       └── get_best_selling_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── best_selling_bloc.dart
│   │       └── view/
│   │           ├── best_selling_view.dart
│   │           └── widgets/
│   │               └── best_selling_card.dart
│   ├── products_view/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── product_model.dart
│   │   │   └── repositories/
│   │   │       └── products_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── product_entity.dart
│   │   │   └── usecases/
│   │   │       └── get_products_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── products_bloc.dart
│   │       └── view/
│   │           ├── products_view.dart
│   │           └── widgets/
│   │               └── product_card.dart
│   ├── checkout/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── checkout_model.dart
│   │   │   └── repositories/
│   │   │       └── checkout_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── checkout_entity.dart
│   │   │   └── usecases/
│   │   │       └── place_order_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── checkout_bloc.dart
│   │       └── view/
│   │           ├── checkout_view.dart
│   │           └── widgets/
│   │               └── checkout_widgets.dart
│   ├── onboarding/
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   └── onboarding_bloc.dart
│   │       └── view/
│   │           ├── onboarding_view.dart
│   │           └── widgets/
│   │               └── onboarding_widgets.dart
│   ├── splash/
│   │   └── presentation/
│   │       └── view/
│   │           └── splash_view.dart
│   └── profile/
│       ├── data/
│       │   ├── models/
│       │   │   └── profile_model.dart
│       │   └── repositories/
│       │       └── profile_repository.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── profile_entity.dart
│       │   └── usecases/
│       │       └── get_profile_usecase.dart
│       └── presentation/
│           ├── bloc/
│           │   └── profile_bloc.dart
│           └── view/
│               ├── profile_view.dart
│               └── widgets/
│                   └── profile_widgets.dart
├── shared_preferences/                 # Local storage helpers
├── assets/                              # Images, fonts, icons
└── test/                                # Unit & widget tests
```
---

This now **matches your real app features** and maintains **Clean Architecture + BLoC + Firebase + Shared Preferences + responsive design**.  

If you want, I can now **update your full README.md** to include **this corrected structure**, all features, tech stack, Firebase instructions, and make it **ready to copy for GitHub**.  

Do you want me to do that?



---

## 🤝 Contributing

1. Fork the repository  
2. Create a branch (`git checkout -b feature/YourFeature`)  
3. Commit your changes (`git commit -m "Add feature"`)  
4. Push (`git push origin feature/YourFeature`)  
5. Open a Pull Request  

---

## 📜 License

This project is open-source under the **MIT License**.

---

## 🙏 Acknowledgements

- Flutter community and open-source libraries  
- Firebase documentation and tutorials  
- Clean Architecture & BLoC best practices  

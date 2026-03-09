# Équilibre Thérapie (Flutter Foundation)

Production-grade first-step architecture for a scalable wellness startup app.

## Setup
1. Install Flutter 3.22+ and Dart 3.4+.
2. Create Firebase project and replace `lib/firebase_options.dart` placeholders.
3. Copy `.env.example` to your environment strategy (`--dart-define` or envied).
4. Install packages:
   ```bash
   flutter pub get
   ```
5. Generate Freezed/JSON code:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
6. Run app:
   ```bash
   flutter run
   ```

## Architecture
- Feature-first + clean architecture layers (presentation/application/domain/data)
- Riverpod state management
- GoRouter navigation + auth/subscription guards
- Firebase auth backend abstraction
- Subscription-ready service layer for Stripe/RevenueCat/IAP

## Included Modules
- Landing + auth flows
- Subscription paywall/manage flows
- Account management skeleton
- Dashboard + 4 wellness pillars placeholders

## Security Notes
- Never ship API secrets in app code.
- Use backend-verified subscription checks via Cloud Functions/API.
- Store sensitive tokens with `flutter_secure_storage`.

# Nutrio Sign Up Screen

This Flutter application implements a sign-up screen for the Nutrio app following best practices and modern UI design.

## Features

### 🌟 Localization Support
- All text content is externalized to `lib/l10n/app_en.arb`
- Supports internationalization with Flutter's `flutter_gen` package
- Easy to add more languages by creating additional `.arb` files

### 📱 UI Components
- **Title & Subtitle**: Localized "Join Nutrio Today ✨" with descriptive subtitle
- **Form Fields**: Email and password inputs with:
  - Relevant icons (email, lock)
  - Placeholder text
  - Validation
  - Password visibility toggle
- **Terms & Conditions**: Checkbox with green checkmark when selected
- **Sign Up Button**: Styled button that's only enabled when terms are accepted
- **Sign In Link**: Styled link for existing users
- **Social Sign Up**: Four social provider buttons (Google, Apple, Facebook, X)

### 🎨 Design & Styling
- Clean, modern design with proper spacing and padding
- Color scheme with primary green color (#4CAF50)
- Rounded corners and clean borders
- Proper typography with Inter font family
- Responsive layout with proper touch targets

### 🔧 State Management
- Form validation with real-time feedback
- Checkbox state management for terms acceptance
- Password visibility toggle
- Form submission handling

### ♿ Accessibility
- Semantic labels for screen readers
- Proper tap targets (minimum 44px)
- Clear visual feedback for interactive elements
- Form validation with helpful error messages

## File Structure

```
flutter_app/
├── lib/
│   ├── l10n/
│   │   └── app_en.arb          # Localization strings
│   ├── screens/
│   │   └── sign_up_screen.dart # Main sign up screen implementation
│   └── main.dart               # App entry point
├── test/
│   └── sign_up_screen_test.dart # Widget tests
├── l10n.yaml                   # Localization configuration
└── pubspec.yaml               # Dependencies and assets
```

## Key Implementation Details

### Localization
All user-facing text is stored in `app_en.arb`:
- `joinNutrioToday`: Main title
- `createAccountSubtitle`: Descriptive subtitle
- `emailLabel`, `passwordLabel`: Field labels
- `termsAndConditions`: Checkbox text
- `signUpButton`, `signInLink`: Button and link text

### Form Validation
- Email validation with regex pattern
- Password minimum length requirement
- Real-time validation feedback
- Terms acceptance requirement

### Accessibility Features
- Semantic labels for all interactive elements
- Proper button and checkbox semantics
- Screen reader friendly descriptions
- Keyboard navigation support

## Dependencies

- `flutter`: Core Flutter framework
- `flutter_localizations`: Internationalization support
- `intl`: Date and number formatting (required for l10n)
- `flutter_test`: Widget testing framework

## Running the App

1. Ensure Flutter is installed
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app
4. Run `flutter test` to execute widget tests

## Future Enhancements

- Add custom icons for social providers
- Implement actual authentication logic
- Add loading states
- Enhanced password requirements
- Biometric authentication options
- Dark theme support
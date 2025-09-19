import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:nutrio_app/screens/sign_up_screen.dart';

void main() {
  group('SignUpScreen Widget Tests', () {
    testWidgets('SignUpScreen displays all required elements', (WidgetTester tester) async {
      // Build the widget with localization support
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          home: const SignUpScreen(),
        ),
      );

      // Verify that key UI elements are present
      expect(find.text('Join Nutrio Today ✨'), findsOneWidget);
      expect(find.text('Create a Nutrio account to track your meals, stay active, and achieve your health goals.'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('I agree to the Terms & Conditions'), findsOneWidget);
      expect(find.text('Sign up'), findsOneWidget);
      expect(find.text('Already have an account? Sign in'), findsOneWidget);
      expect(find.text('Or sign up with'), findsOneWidget);
    });

    testWidgets('Form validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          home: const SignUpScreen(),
        ),
      );

      // Find email and password text fields
      final emailField = find.byKey(const Key('email_field'));
      final passwordField = find.byKey(const Key('password_field'));

      // Test empty form validation
      await tester.tap(find.text('Sign up'));
      await tester.pump();

      // Should show validation errors
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('Terms checkbox controls sign up button state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          home: const SignUpScreen(),
        ),
      );

      // Find the sign up button
      final signUpButton = find.text('Sign up');
      final checkbox = find.byType(Checkbox);

      // Button should be disabled initially (terms not accepted)
      ElevatedButton button = tester.widget(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);

      // Accept terms
      await tester.tap(checkbox);
      await tester.pump();

      // Button should now be enabled
      button = tester.widget(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);
    });

    testWidgets('Social sign up buttons are present', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          home: const SignUpScreen(),
        ),
      );

      // Should have 4 social sign up buttons (Google, Apple, Facebook, X)
      expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
      expect(find.byIcon(Icons.apple), findsOneWidget);
      expect(find.byIcon(Icons.facebook), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget); // X icon placeholder
    });
  });
}
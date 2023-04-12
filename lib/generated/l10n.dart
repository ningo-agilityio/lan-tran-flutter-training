// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `avisit`
  String get logo {
    return Intl.message(
      'avisit',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `av`
  String get logoText {
    return Intl.message(
      'av',
      name: 'logoText',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendarAppBarTitle {
    return Intl.message(
      'Calendar',
      name: 'calendarAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointmentAppBarTitle {
    return Intl.message(
      'Appointments',
      name: 'appointmentAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Appointment`
  String get newAppointmentAppBarTitle {
    return Intl.message(
      'New Appointment',
      name: 'newAppointmentAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `There are no appointments.`
  String get emptyAppointments {
    return Intl.message(
      'There are no appointments.',
      name: 'emptyAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Create New Appointment`
  String get createAppointmentButton {
    return Intl.message(
      'Create New Appointment',
      name: 'createAppointmentButton',
      desc: '',
      args: [],
    );
  }

  /// `Appointment added`
  String get addSuccess {
    return Intl.message(
      'Appointment added',
      name: 'addSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create appointment`
  String get addFail {
    return Intl.message(
      'Failed to create appointment',
      name: 'addFail',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointmentsLabel {
    return Intl.message(
      'Appointments',
      name: 'appointmentsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendarLabel {
    return Intl.message(
      'Calendar',
      name: 'calendarLabel',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileLabel {
    return Intl.message(
      'Profile',
      name: 'profileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationsLabel {
    return Intl.message(
      'Notifications',
      name: 'notificationsLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

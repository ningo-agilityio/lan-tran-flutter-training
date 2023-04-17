// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addFail": MessageLookupByLibrary.simpleMessage(
            "Failed to create appointment"),
        "addSuccess": MessageLookupByLibrary.simpleMessage("Appointment added"),
        "appointmentAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Appointments"),
        "appointmentsLabel":
            MessageLookupByLibrary.simpleMessage("Appointments"),
        "calendarAppBarTitle": MessageLookupByLibrary.simpleMessage("Calendar"),
        "calendarLabel": MessageLookupByLibrary.simpleMessage("Calendar"),
        "createAppointmentButton":
            MessageLookupByLibrary.simpleMessage("Create New Appointment"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "emptyAppointments":
            MessageLookupByLibrary.simpleMessage("There are no appointments."),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "incorrectAccountError": MessageLookupByLibrary.simpleMessage(
            "Phone number or Password is incorrect."),
        "invalidAccountError": MessageLookupByLibrary.simpleMessage(
            "Phone number or Password is invalid."),
        "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "logo": MessageLookupByLibrary.simpleMessage("avisit"),
        "logoText": MessageLookupByLibrary.simpleMessage("av"),
        "newAppointmentAppBarTitle":
            MessageLookupByLibrary.simpleMessage("New Appointment"),
        "notificationsLabel":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "profileLabel": MessageLookupByLibrary.simpleMessage("Profile")
      };
}

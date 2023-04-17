import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 10, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 10, kToday.month, kToday.day);

Future<Map<String, dynamic>> getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userStr = prefs.getString('user') ?? '{}';
  return jsonDecode(userStr);
}

import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/bottom_app_bar.dart';
import 'package:salon_appointment/widgets/date_picker.dart';
import 'package:salon_appointment/widgets/dropdown.dart';
import 'package:salon_appointment/widgets/modal_bottom_sheet.dart';
import 'package:salon_appointment/widgets/time_picker.dart';

import '../theme/theme.dart';
import '../widgets/add_button.dart';
import '../widgets/common/buttons.dart';
import '../widgets/input.dart';
import 'appointments_screen.dart';
import 'calendar_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  int _currentIndex = 1;

  final _CalendarScreen = GlobalKey<NavigatorState>();
  final _AppointmentsScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _AppointmentsScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => AppointmentsScreen(),
            ),
          ),
          Navigator(
            key: _CalendarScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => CalendarScreen(),
            ),
          ),
        ],
      ),
      floatingActionButton: AddButton(
        onPress: () => ModalBottomSheet.show(context),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: CusTomBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

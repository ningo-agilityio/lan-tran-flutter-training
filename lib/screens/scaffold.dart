import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/bottom_app_bar.dart';
import 'package:salon_appointment/widgets/common/buttons.dart';
import 'package:salon_appointment/widgets/common/icons.dart';
import 'package:salon_appointment/widgets/modal_bottom_sheet.dart';
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

  final _calendarScreen = GlobalKey<NavigatorState>();
  final _appointmentScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _appointmentScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const AppointmentScreen(),
            ),
          ),
          Navigator(
            key: _calendarScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const CalendarScreen(),
            ),
          ),
        ],
      ),
      floatingActionButton: SAButton.floating(
        child: CustomIcons.addButtonIcon,
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

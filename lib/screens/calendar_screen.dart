import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:salon_appointment/widgets/bottom_app_bar.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';

import '../utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _selectedIndex = 0;

  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.centerDocked;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(
            color: Color(0xFF0C122A),
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            fontSize: 20,
            height: 30,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),

      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Create',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemoBottomAppBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   bottomBarItems: [
      //     BottomBarItemsModel(
      //       icon: Icon(Icons.home, size: 24),
      //       iconSelected: Icon(Icons.home,
      //           color: Theme.of(context).colorScheme.onSecondary, size: 24),
      //       dotColor: Theme.of(context).colorScheme.onSecondary,
      //       onTap: () {},
      //     ),
      //     BottomBarItemsModel(
      //       icon: Icon(Icons.search, size: 24),
      //       iconSelected: Icon(Icons.search,
      //           color: Theme.of(context).colorScheme.onSecondary, size: 24),
      //       dotColor: Theme.of(context).colorScheme.onSecondary,
      //       onTap: () {},
      //     ),
      //     BottomBarItemsModel(
      //       icon: Icon(Icons.person, size: 24),
      //       iconSelected: Icon(Icons.person,
      //           color: Theme.of(context).colorScheme.onSecondary, size: 24),
      //       dotColor: Theme.of(context).colorScheme.onSecondary,
      //       onTap: () {},
      //     ),
      //     BottomBarItemsModel(
      //       icon: Icon(Icons.settings, size: 24),
      //       iconSelected: Icon(Icons.settings,
      //           color: Theme.of(context).colorScheme.onSecondary, size: 24),
      //       dotColor: Theme.of(context).colorScheme.onSecondary,
      //       onTap: () {},
      //     ),
      //   ],
      //   bottomBarCenterModel: BottomBarCenterModel(
      //     centerBackgroundColor: Theme.of(context).colorScheme.onSecondary,
      //     centerIcon: FloatingCenterButton(
      //       child: Icon(
      //         Icons.add,
      //         color: Theme.of(context).colorScheme.onSecondary,
      //       ),
      //     ),
      //     centerIconChild: [],
      //   ),
      // ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.white,
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Recent',
              icon: const Icon(Icons.check),
              color: Color(0xFFBFC8DC),
              iconSize: 24,
              onPressed: () {},
            ),
            SizedBox(width: 21),
            IconButton(
              tooltip: 'Schedule',
              icon: const Icon(Icons.schedule),
              color: Color(0xFFBFC8DC),
              iconSize: 24,
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.person),
              color: Color(0xFFBFC8DC),
              iconSize: 24,
              onPressed: () {},
            ),
            SizedBox(width: 21),
            IconButton(
              tooltip: 'Notifications',
              icon: const Icon(Icons.notifications),
              color: Color(0xFFBFC8DC),
              iconSize: 24,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

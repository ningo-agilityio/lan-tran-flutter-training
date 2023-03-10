import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/add_button.dart';
import '../widgets/common/buttons.dart';
import 'appointments_screen.dart';
import 'calendar_screen.dart';

class SAScaffold extends StatefulWidget {
  SAScaffold({super.key, required this.appBar, required this.body});

  AppBar appBar;
  Widget body;

  @override
  State<SAScaffold> createState() => _SAScaffoldState();
}

class _SAScaffoldState extends State<SAScaffold> {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      floatingActionButton: _showFab ? AddButton(onPress: () {}) : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemoBottomAppBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
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
      color: SATheme.lightTheme.colorScheme.secondary,
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SAButton.icon(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.check),
            ),
            SAButton.icon(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalendarScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.schedule),
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            SAButton.icon(
              onPress: () {},
              icon: const Icon(Icons.person),
            ),
            SAButton.icon(
              onPress: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}

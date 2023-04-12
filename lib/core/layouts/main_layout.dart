import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/icons.dart';
import '../widgets/text.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    required this.title,
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final String title;
  final Widget child;
  final int currentIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.appBarTitle(
          text: widget.title,
          style: themeData.textTheme.titleLarge!,
        ),
        automaticallyImplyLeading: false,
      ),
      body: widget.child,
      floatingActionButton: SAButton.floating(
        child: CustomIcons.add,
        onPressed: () => Navigator.of(context).pushNamed('/add'),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                // Appointment Screen
                Navigator.of(context).pushNamed('/appointment');
                break;
              case 1:
                // Calendar Screen
                Navigator.of(context).pushNamed('/calendar');
                break;
            }
          });
        },
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: themeData.colorScheme.onPrimary,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: themeData.colorScheme.primary,
        unselectedItemColor: themeData.colorScheme.onTertiary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

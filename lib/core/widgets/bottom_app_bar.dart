import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class CusTomBottomAppBar extends StatelessWidget {
  const CusTomBottomAppBar({
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
        backgroundColor: themeData.colorScheme.secondary,
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

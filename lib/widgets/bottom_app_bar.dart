import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/common/buttons.dart';

class CusTomBottomAppBar extends StatelessWidget {
  const CusTomBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onTertiary,
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
      // IconButtonTheme(
      //   data: IconButtonThemeData(),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     child: Row(
      //       children: <Widget>[
      //         SAButton.icon(
      //           icon: const Icon(Icons.check),
      //           onPress: () {},
      //         ),
      //         SizedBox(width: 16.0),
      //         SAButton.icon(
      //           icon: const Icon(Icons.schedule),
      //           onPress: () {},
      //         ),
      //         const Spacer(),
      //         SAButton.icon(
      //           icon: const Icon(Icons.person),
      //           onPress: () {},
      //         ),
      //         SizedBox(width: 16.0),
      //         SAButton.icon(
      //           icon: const Icon(Icons.notifications),
      //           onPress: () {},
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/generated/l10n.dart';
import '../widgets/buttons.dart';
import '../widgets/icons.dart';
import '../widgets/text.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    required this.title,
    required this.currentIndex,
    required this.child,
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
        title: SAText.appBarTitle(
          text: widget.title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        automaticallyImplyLeading: false,
      ),
      body: widget.child,
      floatingActionButton: SAButton.floating(
        child: const SAIcons.add(),
        onPressed: () => Navigator.pushNamed(context, '/newAppointment'),
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
                Navigator.pushNamed(context, '/appointment');
                break;
              case 1:
                // Calendar Screen
                Navigator.pushNamed(context, '/calendar');

                break;
              case 2:
                // Profile Screen
                Navigator.pushNamed(context, '/profile');
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: colorScheme.onPrimary,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onTertiary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.check),
            label: S.of(context).appointmentsLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.schedule),
            label: S.of(context).calendarLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: S.of(context).profileLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: S.of(context).notificationsLabel,
          ),
        ],
      ),
    );
  }
}

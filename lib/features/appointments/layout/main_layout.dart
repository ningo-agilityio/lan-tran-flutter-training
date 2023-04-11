import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/bottom_app_bar.dart';
import '../../../core/widgets/common/buttons.dart';
import '../../../core/widgets/common/icons.dart';
import '../../../core/widgets/common/text.dart';

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
      ),
      body: widget.child,
      floatingActionButton: SAButton.floating(
        child: CustomIcons.add,
        onPressed: () => Navigator.of(context).pushNamed('/add'),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: CusTomBottomAppBar(
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
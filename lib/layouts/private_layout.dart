import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/bottom_app_bar.dart';
import 'package:salon_appointment/widgets/common/buttons.dart';
import 'package:salon_appointment/widgets/common/icons.dart';
import 'package:salon_appointment/widgets/modal_bottom_sheet.dart';
import '../theme/theme.dart';
import '../widgets/common/text.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    required this.title,
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final String title;
  final Widget child;
  final int currentIndex;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
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
        child: CustomIcons.addButtonIcon,
        onPress: () => ModalBottomSheet.show(context),
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

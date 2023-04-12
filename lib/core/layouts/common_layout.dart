import 'package:flutter/material.dart';
import 'package:salon_appointment/core/constants/assets.dart';
import 'package:salon_appointment/core/constants/constants.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class CommonLayout extends StatelessWidget {
  const CommonLayout({
    required this.child,
    this.bgColor,
    this.bgImage,
    super.key,
  });

  final Widget child;
  final Color? bgColor;
  final ImageProvider<Object>? bgImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage ?? Assets.BG_IMAGE,
            colorFilter: ColorFilter.mode(
              bgColor ?? themeData.colorScheme.primary.withOpacity(0.5),
              BlendMode.multiply,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}

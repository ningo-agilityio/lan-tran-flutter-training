import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

// class PrimaryColorText extends SAButton {
//   const _SATextButton({
//     required super.style,
//     required super.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       value,
//       style: TextStyle(
//         ...style,
//         color: SATheme.lightTheme.colorScheme.onSecondary,
//       ),
//     );
//   }
// }

class CommonLayout extends StatelessWidget {
  const CommonLayout({
    required this.child,
    this.bgColor,
    this.bgImage,
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
            image: bgImage ?? const AssetImage('assets/background.png'),
            colorFilter: ColorFilter.mode(
              bgColor ??
                  SATheme.lightTheme.colorScheme.primary.withOpacity(0.5),
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

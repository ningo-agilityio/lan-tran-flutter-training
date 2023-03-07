import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment/widgets/logo.dart';
import 'package:salon_appointment/widgets/time.dart';
import 'package:salon_appointment/widgets/customer.dart';
import 'package:salon_appointment/widgets/services.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/login_button.dart';
import 'package:salon_appointment/widgets/forget_password.dart';

void main() {
  runApp(
    const WidgetbookHotReload(),
  );
}

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          folders: [
            // WidgetbookFolder(
            //   name: 'Appointment',
            //   widgets: [
            //     WidgetbookComponent(
            //       name: '$Time',
            //       useCases: [
            //         WidgetbookUseCase(
            //           name: 'Schedule Time',
            //           builder: (context) => Time(),
            //         ),
            //       ],
            //     ),
            //     WidgetbookComponent(
            //       name: 'Customer',
            //       useCases: [
            //         WidgetbookUseCase(
            //           name: 'Customer Name',
            //           builder: (context) => Customer(),
            //         ),
            //       ],
            //     ),
            //     WidgetbookComponent(
            //       name: 'Services',
            //       useCases: [
            //         WidgetbookUseCase(
            //           name: 'Services',
            //           builder: (context) => Services(),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            WidgetbookFolder(
              name: 'Form Input',
              widgets: [
                WidgetbookComponent(
                  name: 'TextInput',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Phone number',
                      builder: (context) => Input(
                        text: 'Phone number',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Password',
                      builder: (context) => Input(
                        text: 'Password',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          widgets: [
            WidgetbookComponent(
              name: '$Logo',
              useCases: [
                WidgetbookUseCase(
                    name: 'Logo', builder: (context) => const Logo()),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(
        name: 'Salon Appointment',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
        WidgetbookTheme(
          name: 'Purple',
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
          ),
        )
      ],
      devices: [
        Apple.iPhoneXs,
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('vn', 'VN'),
      ],
    );
  }
}

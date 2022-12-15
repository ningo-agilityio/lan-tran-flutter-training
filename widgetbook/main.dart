import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment/widgets/logo.dart';
import 'package:salon_appointment/widgets/time.dart';
import 'package:salon_appointment/widgets/customer.dart';
import 'package:salon_appointment/widgets/services.dart';

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
          widgets: [
            WidgetbookComponent(
              name: '$Time',
              useCases: [
                WidgetbookUseCase(
                  name: 'Schedule Time',
                  builder: (context) => Time(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Customer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Customer Name',
                  builder: (context) => Customer(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Services',
              useCases: [
                WidgetbookUseCase(
                  name: 'Services',
                  builder: (context) => Services(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: '$Logo',
              useCases: [
                WidgetbookUseCase(
                    name: 'Logo', builder: (context) => const Logo()),
              ],
            ),
          ],
        )
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
        )
      ],
    );
  }
}

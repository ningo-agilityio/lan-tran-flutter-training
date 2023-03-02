import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment/widgets/logo.dart';
import 'package:salon_appointment/widgets/time.dart';
import 'package:salon_appointment/widgets/customer.dart';
import 'package:salon_appointment/widgets/services.dart';
import 'package:salon_appointment/widgets/text_input.dart';
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
                      builder: (context) => TextInput(
                        text: 'Phone number',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Password',
                      builder: (context) => TextInput(
                        text: 'Password',
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Forget password',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Forget password',
                      builder: (context) => ForgetPassword(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Login button',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Login button',
                      builder: (context) => LoginButton(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'FormInput',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'FormInput',
                      builder: (context) => Form(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextInput(
                                text: 'Phone number',
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16),
                              TextInput(
                                text: 'Password',
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(height: 16),
                              ForgetPassword(),
                              SizedBox(height: 24),
                              LoginButton()
                            ],
                          ),
                        ),
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

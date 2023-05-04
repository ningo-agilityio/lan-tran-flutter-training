import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/core/layouts/main_layout.dart';
import 'package:salon_appointment/core/utils.dart';
import 'package:salon_appointment/core/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/dialog.dart';
import '../../../core/widgets/indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    late Map<String, dynamic> user;
    final i10n = S.of(context);

    return FutureBuilder(
        future: getUser(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data!;

            return MainLayout(
              title: i10n.profileAppBarTitle,
              currentIndex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.onSurface,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme.onPrimary,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(user['avatar']),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SAText(
                        text: user['name'],
                        style: textTheme.displaySmall!.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                        ),
                        child: SAButton.icon(
                          child: Icon(
                            Icons.logout,
                            color: colorScheme.onPrimary,
                            size: 24,
                          ),
                          onPressed: () {
                            AlertConfirmDialog.show(
                              context: context,
                              title: i10n.logoutConfirmTitle,
                              message: i10n.logoutConfirmMessage,
                              onPressedRight: () {
                                showDialog(
                                  context: context,
                                  barrierColor: colorScheme.onBackground,
                                  builder: (context) => LoadingIndicator(
                                    height: indicatorHeight,
                                  ),
                                );

                                SharedPreferences.getInstance().then((value) {
                                  value.remove('user');
                                });

                                Timer(const Duration(seconds: 3), () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/login',
                                    (route) => false,
                                  );
                                });
                              },
                              onPressedLeft: () {
                                Navigator.pop(context, false);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return LoadingIndicator(
            height: indicatorHeight,
          );
        });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/core/layouts/main_layout.dart';
import 'package:salon_appointment/core/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/widgets/buttons.dart';
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

    late String userName = '';
    late String userAvatar = '';

    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (_, snapshot) {
          SharedPreferences.getInstance().then((value) {
            userName = value.getString('name')!;
            userAvatar = value.getString('avatar')!;
          });
          return MainLayout(
            title: S.of(context).profileAppBarTitle,
            currentIndex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.onSurface,
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
                        color: Theme.of(context).colorScheme.onPrimary,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(userAvatar),
                        ),
                      ),
                    ),
                    SAText(
                      text: userName,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
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
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 24,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierColor:
                                Theme.of(context).colorScheme.onBackground,
                            builder: (context) => LoadingIndicator(
                              height: indicatorHeight,
                            ),
                          );

                          SharedPreferences.getInstance().then((value) {
                            value
                              ..remove('id')
                              ..remove('name')
                              ..remove('phoneNumber')
                              ..remove('avatar')
                              ..remove('password');
                          });

                          Timer(const Duration(seconds: 3), () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                              (route) => false,
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

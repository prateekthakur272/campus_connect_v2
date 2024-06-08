import 'dart:ui';
import 'package:campus_connect_v2/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(alignment: Alignment.center, children: [
        Container(),
        Align(
          alignment: const AlignmentDirectional(1.7, -1.5),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-6, .7),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 70,
              ),
              const Text(
                AppConstants.appTitle,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                AppConstants.appIntro,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.7)),
              ),
              16.space,
              const Divider(),
              16.space,
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/login');
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        foregroundColor: Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(AppConstants.textLogin),
                  )),
              24.space,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: OutlinedButton(
                  onPressed: () {
                    context.push('/register');
                  },
                  style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(AppConstants.textRegister),
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}

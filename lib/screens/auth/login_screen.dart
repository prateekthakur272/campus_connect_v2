import 'dart:developer';
import 'dart:ui';

import 'package:campus_connect_v2/constants/constants.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Align(
            alignment: const AlignmentDirectional(-6, -1.8),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.1,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: colorScheme.secondary, shape: BoxShape.circle),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(15, 1),
            child: Transform(
              transform: Matrix4.rotationZ(0.5),
              child: Container(
                height: MediaQuery.of(context).size.width / 1.1,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: colorScheme.tertiary, shape: BoxShape.rectangle),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome\nBack',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Login to Campus Connect',
                    style: TextStyle(fontSize: 16),
                  ),
                  space24,
                  Align(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                fillColor:
                                    colorScheme.onBackground.withOpacity(0.1),
                                filled: true,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                }
                                return null;
                              },
                            ),
                            space24,
                            TextFormField(
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  fillColor:
                                      colorScheme.onBackground.withOpacity(0.1),
                                  filled: true,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: _hidePassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _hidePassword = !_hidePassword;
                                      });
                                    },
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                            space24,
                            Row(
                              children: [
                                const Spacer(),
                                const Text(
                                  'LogIn',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                                space24,
                                IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      log('message');
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                  style: IconButton.styleFrom(
                                      backgroundColor: colorScheme.primary,
                                      foregroundColor: colorScheme.onPrimary,
                                      minimumSize: const Size.square(56)),
                                )
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

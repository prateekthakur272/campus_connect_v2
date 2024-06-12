import 'dart:ui';
import 'package:campus_connect_v2/constants/constants.dart';
import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triton_extensions/triton_extensions.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  final TextEditingController usernameController =
      TextEditingController(text: 'prateek');
  final TextEditingController passwordController =
      TextEditingController(text: 'prateek@1234');

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
                    AppConstants.textGreeting,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    AppConstants.textLoginToCampusConnect,
                    style: TextStyle(fontSize: 16),
                  ),
                  24.space,
                  Align(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: AppConstants.hintTextEmail,
                                fillColor:
                                    colorScheme.onBackground.withOpacity(0.1),
                                filled: true,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppConstants.validatorTextEmail;
                                }
                                return null;
                              },
                            ),
                            24.space,
                            TextFormField(
                              controller: passwordController,
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                  hintText: AppConstants.hintTextPassword,
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
                                  return AppConstants.validatorPassword;
                                }
                                return null;
                              },
                            ),
                            24.space,
                            Row(
                              children: [
                                const Spacer(),
                                const Text(
                                  AppConstants.textLogin,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                                24.space,
                                IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthenticationBloc>().add(
                                          Login(usernameController.text.trim(),
                                              passwordController.text.trim()));
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

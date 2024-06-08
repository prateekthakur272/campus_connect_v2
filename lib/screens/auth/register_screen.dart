import 'dart:ui';
import 'package:campus_connect_v2/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: SafeArea(
      child: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: const AlignmentDirectional(8, .7),
          child: Container(
            height: MediaQuery.of(context).size.width / 1.1,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: colorScheme.secondary, shape: BoxShape.circle),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-5, -2),
          child: Transform(
            transform: Matrix4.rotationZ(0.4),
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
                  AppConstants.textCreateAccountHeading,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  AppConstants.textCreateAccountSubHeading,
                  style: TextStyle(fontSize: 16),
                ),
                24.space,
                Align(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
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
                            decoration: InputDecoration(
                              hintText: AppConstants.hintTextFullName,
                              fillColor:
                                  colorScheme.onBackground.withOpacity(0.1),
                              filled: true,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppConstants.validatorFullName;
                              }
                              return null;
                            },
                          ),
                          24.space,
                          TextFormField(
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
                                AppConstants.textCreateAccount,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 24),
                              ),
                              24.space,
                              IconButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
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
    ));
  }
}

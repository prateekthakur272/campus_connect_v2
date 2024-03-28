import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xff19647e),
        onPrimary: Colors.white,
        secondary: const Color(0xff28AFB0),
        onSecondary: Colors.black,
        tertiary: const Color(0xffF4D35E),
        onTertiary: Colors.black,
        error: Colors.red.shade300,
        onError: Colors.white,
        background: Colors.grey.shade200,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    dividerTheme: const DividerThemeData(color: Colors.black26),
  );

final darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: const Color(0xff19647e),
        onPrimary: Colors.white,
        secondary: const Color(0xff28AFB0),
        onSecondary: Colors.black,
        tertiary: const Color(0xffF4D35E),
        onTertiary: Colors.black,
        error: Colors.red.shade300,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: Colors.grey.shade900,
        onSurface: Colors.white),
    dividerTheme: const DividerThemeData(color: Colors.white38)
  );

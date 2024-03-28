import 'package:campus_connect_v2/constants/theme.dart';
import 'package:campus_connect_v2/screens/auth/auth_screen.dart';
import 'package:campus_connect_v2/screens/auth/login_screen.dart';
import 'package:campus_connect_v2/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const AuthScreen(),),
  GoRoute(path: '/login', builder: (context, state) => const LogInScreen(),),
  GoRoute(path: '/register', builder: (context, state) => const RegisterScreen(),),
]);
import 'package:campus_connect_v2/constants/theme.dart';
import 'package:campus_connect_v2/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}

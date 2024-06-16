import 'package:campus_connect_v2/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

import 'shared/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}

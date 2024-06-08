import 'package:campus_connect_v2/core/navigation/app_routes.dart';
import 'package:campus_connect_v2/screens/auth/login_screen.dart';
import 'package:campus_connect_v2/screens/auth/register_screen.dart';
import 'package:campus_connect_v2/screens/home/auth_home_controller.dart';
import 'package:campus_connect_v2/screens/profile_screen/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(routes: [
    GoRoute(
      name: AppRoutes.start.name,
      path: '/',
      builder: (context, state) => const AuthHomeController(),
      routes: [
        GoRoute(
          name: AppRoutes.login.name,
          path: 'login',
          builder: (context, state) => const LogInScreen(),
        ),
        GoRoute(
          name: AppRoutes.register.name,
          path: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          name: AppRoutes.profile.name,
          path: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ]
    ),
  ]);
}

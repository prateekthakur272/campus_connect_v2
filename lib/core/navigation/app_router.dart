import 'package:campus_connect_v2/core/navigation/app_routes.dart';
import 'package:campus_connect_v2/screens/auth_screen/auth_home_builder.dart';
import 'package:campus_connect_v2/screens/auth_screen/login_screen.dart';
import 'package:campus_connect_v2/screens/auth_screen/register_screen.dart';
import 'package:campus_connect_v2/screens/profile_screen/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(routes: [
    GoRoute(
      name: AppRoutes.home.name,
      path: '/',
      builder: (context, state) => const AuthHomeBuilder(),
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
  ],
    // redirect: (context, state) async {
    //   final status = await context.read<AuthenticationBloc>().state.status;
    //   if(status == AuthenticationStatus.unauthenticated){
    //     return '/login';
    //   }
    //   return null;
    // }
  );
}

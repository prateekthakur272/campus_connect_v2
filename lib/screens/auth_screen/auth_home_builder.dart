import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:campus_connect_v2/screens/auth_screen/login_screen.dart';
import 'package:campus_connect_v2/screens/home_screen/home_screen.dart';
import 'package:campus_connect_v2/shared/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHomeBuilder extends StatelessWidget {
  const AuthHomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(LoadUserDetails());
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if(state.status == AuthenticationStatus.authenticated) {
          return const HomeScreen();
        }else if(state.status == AuthenticationStatus.loading){
          return const Scaffold(body: Center(child: Loader(),),);
        }
        return const LogInScreen();
      }
    );
  }
}

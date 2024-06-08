import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:campus_connect_v2/screens/auth/auth_screen.dart';
import 'package:campus_connect_v2/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHomeController extends StatelessWidget {
  const AuthHomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state){
      if(state.status == AuthenticationStatus.authenticated){
        return const HomeScreen();
      }
      return const AuthScreen();
    });
  }
}
import 'package:campus_connect_v2/app.dart';
import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc()..add(LoadAuthenticationState()),
      child: const MyApp()));
}

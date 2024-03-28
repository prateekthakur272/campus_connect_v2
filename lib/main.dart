import 'package:campus_connect_v2/app.dart';
import 'package:campus_connect_v2/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  runApp(BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc()..add(LoadAuthenticationState()),
      child: const MyApp()));
}

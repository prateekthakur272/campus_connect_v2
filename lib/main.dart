import 'package:campus_connect_v2/app.dart';
import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/blocs/bloc_observer.dart';
import 'screens/auth_screen/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => authenticationRepository)
    ],
    child: BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) =>
            AuthenticationBloc(context.read<AuthenticationRepository>()),
        child: const MyApp()),
  ));
}

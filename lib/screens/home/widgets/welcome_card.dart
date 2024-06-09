import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triton_extensions/triton_extensions.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: 16.padding,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome\n${state.currentUser!.firstName} ${state.currentUser!.lastName},',
                          style: context.textTheme.titleLarge,
                        ),
                        Text(
                          DateTime.now().toString().substring(0, 10),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Badge.count(
                    count: 3,
                    backgroundColor: context.colorScheme.primary,
                    child: IconButton(
                        iconSize: 32,
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications/');
                        },
                        icon: const Icon(FontAwesomeIcons.solidBell)),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}

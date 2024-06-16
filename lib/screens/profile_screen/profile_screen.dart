import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:campus_connect_v2/core/navigation/app_routes.dart';
import 'package:campus_connect_v2/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: state.status == AuthenticationStatus.authenticated
              ? Text(state.currentUser!.fullName)
              : null,
        ),
        body: ListView(
          padding: 16.padding,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/p__/images/c/cf/JACK_PERSO.png/revision/latest?cb=20210212191647&path-prefix=protagonist'),
                      radius: 56,
                    ),
                    16.space,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.currentUser!.fullName,
                          style: context.textTheme.headlineSmall,
                        ),
                        Text(
                          state.currentUser!.email,
                          style: context.textTheme.titleSmall,
                        ),
                        4.space,
                        OutlinedButton(
                            onPressed: () {}, child: const Text('Edit Details'))
                      ],
                    )
                  ],
                ),
                24.space,
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Change Password'),
                  subtitle: const Text(
                      'Use a strong password to keep your account safe.'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('App Preferences'),
                  subtitle: const Text('Theme, Colors and more.'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: context.colorScheme.error,
                  ),
                  title: Text(
                    'Log Out',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.error),
                  ),
                  onTap: () {
                    context.read<AuthenticationBloc>().add(LogOut());
                    context.goNamed(AppRoutes.home.name);
                  },
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}

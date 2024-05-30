import 'package:campus_connect_v2/screens/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triton_extensions/triton_extensions.dart';

class WelcomeCard extends StatelessWidget {
  final User user;
  const WelcomeCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome\n${user.firstName} ${user.lastName},',
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
      ),
    );
  }
}

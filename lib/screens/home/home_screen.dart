import 'package:campus_connect_v2/screens/home/widgets/home_card.dart';
import 'package:campus_connect_v2/screens/home/widgets/welcome_card.dart';
import 'package:campus_connect_v2/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.background,
        leading: IconButton(
            onPressed: () {
              context.push('/profile');
            },
            icon: const Icon(FontAwesomeIcons.solidUser)),
        title: Text(
          AppConstants.appTitle,
          style: context.textTheme.titleMedium,
        ),
      ),
      body: ListView(
        children: [
          const WelcomeCard(),
          GridView.count(
            padding: 16.padding,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount:
            (width / 480).round() > 0 ? (width / 480).round() : 1,
            childAspectRatio: 2.5,
            children: [
              HomeCard(
                heading: 'Academics',
                body: 'Results, Attendance and course details',
                image: const AssetImage('assets/academics.png'),
                icon: const Icon(FontAwesomeIcons.userGraduate),
                onTap: () {
                  context.push('/academics');
                },
              ),
              HomeCard(
                heading: 'Library',
                body: 'Track books and dues',
                image: const AssetImage('assets/library.png'),
                icon: const Icon(FontAwesomeIcons.book),
                onTap: () {
                  context.push('/library');
                },
              ),
              HomeCard(
                heading: 'Student Section',
                body: 'Exam form, Course Registration etc.',
                image: const AssetImage('assets/students.png'),
                icon: const Icon(FontAwesomeIcons.userGraduate),
                onTap: () {},
              ),
              HomeCard(
                heading: 'Fees Payment',
                body: 'Collage and Bus fees payment',
                image: const AssetImage('assets/fees.png'),
                icon: const Icon(FontAwesomeIcons.moneyBill),
                onTap: () {
                  context.push('/fees-payment');
                },
              ),
              HomeCard(
                heading: 'Bus Service',
                body: 'Bus pass and routes',
                image: const AssetImage('assets/bus.png'),
                icon: const Icon(FontAwesomeIcons.bus),
                onTap: () {
                  context.push('/bus-service');
                },
              ),
              HomeCard(
                heading: 'Syllabus',
                body: 'All course syllabus',
                image: const AssetImage('assets/syllabus.png'),
                icon: const Icon(FontAwesomeIcons.file),
                onTap: () {
                  context.push('/syllabus');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

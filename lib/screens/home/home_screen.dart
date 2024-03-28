import 'dart:ui';
import 'package:campus_connect_v2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: const AlignmentDirectional(-6, -1.8),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.1,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: colorScheme.secondary, shape: BoxShape.circle),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(15, 1),
            child: Transform(
              transform: Matrix4.rotationZ(0.5),
              child: Container(
                height: MediaQuery.of(context).size.width / 1.1,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: colorScheme.primary, shape: BoxShape.rectangle),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: colorScheme.tertiary),
                      child: Icon(
                        Icons.person,
                        size: 32,
                        color: colorScheme.background,
                      ),
                    ),
                    space8,
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Prateek Thakur',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          shape: CircleBorder(
                              side: BorderSide(
                            color: colorScheme.onBackground.withOpacity(.4),
                          )),
                          iconSize: 24),
                    )
                  ],
                ),
                space24,
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                                  color: colorScheme.surface.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(16)),
                      ),
                      space24,
                      const Text('Top Features', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      space8,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              height: 160,
                              decoration: BoxDecoration(
                                  color: colorScheme.surface.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(alignment: Alignment.bottomRight,child: Image.asset('assets/images/academic.png'),),
                            ),
                            space24,
                            Container(
                              height: 160,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: colorScheme.surface.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(alignment: Alignment.bottomRight,child: Image.asset('assets/images/bus.png'),),
                            ),
                            space24,
                            Container(
                              height: 160,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: colorScheme.surface.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(alignment: Alignment.bottomRight,child: Image.asset('assets/images/fees.png'),),
                            ),
                          ],
                        ),
                      ),
                      space24,
                      const Text('All Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      space8,
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface.withOpacity(.5),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: (){},
                              leading: const Icon(Icons.school),
                              title: const Text('Academics'),
                              subtitle: const Text('View exam results and performance'),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: const Icon(Icons.pie_chart),
                              title: const Text('Attendance'),
                              subtitle: const Text('Track overall and subject wise attendance'),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: const Icon(Icons.payment),
                              title: const Text('Fees Payment'),
                              subtitle: const Text('Pay fees or download payment reciept'),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: const Icon(Icons.file_open),
                              title: const Text('Syllabus'),
                              subtitle: const Text('download syllabus'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

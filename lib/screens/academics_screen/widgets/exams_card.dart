import 'package:campus_connect_v2/screens/academics_screen/blocs/academics_bloc.dart';
import 'package:campus_connect_v2/shared/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triton_extensions/triton_extensions.dart';

class ExamsCard extends StatelessWidget {
  const ExamsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcademicsBloc, AcademicsState>(
      builder: (context, state) {
        if (state.status == AcademicStatus.success) {
          if (state.exams!.isNotEmpty) {
            final upcoming = state.exams!.take(3).toList();
            return Card(
              child: Padding(
                padding: 16.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      AppConstants.textUpcomingExams,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ] +
                      upcoming
                          .map((exam) => ListTile(
                        title: Text(exam.name),
                        subtitle: Text(
                            exam.examDate.toString().substring(0, 10)),
                        leading: const Icon(FontAwesomeIcons.book),
                      ))
                          .toList(),
                ),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

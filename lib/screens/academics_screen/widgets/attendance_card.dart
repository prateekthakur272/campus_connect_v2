import 'package:campus_connect_v2/screens/academics_screen/blocs/academics_bloc.dart';
import 'package:campus_connect_v2/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:triton_extensions/triton_extensions.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcademicsBloc, AcademicsState>(
      builder: (context, state) {
        if (state.status == AcademicStatus.success) {
          final attendance = state.attendance!;
          final overall = attendance.percentage();
          return Card(
            // surfaceTintColor: Colors.transparent,
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: 16.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Attendance',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  16.space,
                  Center(
                    child: CircularPercentIndicator(
                      radius: 76,
                      lineWidth: 16,
                      animation: true,
                      percent: overall,
                      center: Text(
                        '${(overall * 100).round()}%',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      progressColor: overall >= .75
                          ? AppColors.positive
                          : AppColors.negative,
                      circularStrokeCap: CircularStrokeCap.round,
                      footer: Padding(
                        padding: 8.padding,
                        child: Text(
                          getMessage(overall),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  8.space,
                  ExpansionTile(
                    title: const Text('View Attandance'),
                    children: attendance.attendance.map((e) {
                      final subject = state.subjects!.firstWhere((element) => element.id == e.subjectId);
                      return ListTile(
                        title: Text(
                            '${subject.name} (${subject.code})'),
                        subtitle: Text(e.attendance.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  String getMessage(double percent) {
    String message = '';
    if (percent < 0.50) {
      message =
          'You\'r attendance is too poor, you would not be able to apear in exam if not mantained';
    } else if (percent < 0.75) {
      message =
          'You\'r attendance is below 75, please attend classes regularly';
    } else if (percent < 0.85) {
      message = 'You have mantained good attendance keep going';
    } else {
      message = 'Excellent attandance keep going';
    }
    return message;
  }
}

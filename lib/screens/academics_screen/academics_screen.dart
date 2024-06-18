import 'package:campus_connect_v2/core/blocs/authentication_bloc.dart';
import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/attendance_repository.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/subject_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _logger = Logger('AttendanceScreen');

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AttendanceRepository attendanceRepository = AttendanceRepository();
    attendanceRepository.getAllAttendance().then((value) {
      _logger.log(value.toString());
    });
    attendanceRepository.getOverallAttendance().then((value) {
      _logger.log(value.toString());
    });
    final SubjectRepository subjectRepository =
        SubjectRepository(context.read<AuthenticationBloc>().repository);
    subjectRepository.getAllSubjects().then((value) {
      _logger.log(value.toString());
    });
    subjectRepository.getSubjectById(2).then((value){
      _logger.log(value.toString());
    });

    return const Placeholder();
  }
}

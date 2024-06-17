import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/attendance_repository.dart';
import 'package:flutter/material.dart';

final _logger = Logger('AttendanceScreen');

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AttendanceRepository attendanceRepository = AttendanceRepository();
    attendanceRepository.getAllAttendance().then((value){
      _logger.log(value.toString());
    });
    attendanceRepository.getOverallAttendance().then((value){
      _logger.log(value.toString());
    });
    return const Placeholder();
  }
}

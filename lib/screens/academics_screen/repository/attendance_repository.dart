import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/models/models.dart';

abstract class _BaseAttendanceRepository{
  final Logger _logger = Logger('AttendanceRepository');
  final HttpClient _httpClient = HttpClient();
  final String _baseUrl = 'http://localhost:8000/';

  Future<OverallAttendance> getOverallAttendance();
  Future<List<SubjectAttendance>> getAllAttendance();
}

class AttendanceRepository extends _BaseAttendanceRepository{
  @override
  Future<List<SubjectAttendance>> getAllAttendance() async {
    Json res = await _httpClient.get('${_baseUrl}my-attendance/prateek');
    final List data = res['data'];
    return data.map((attendance) => SubjectAttendance.fromJson(attendance)).toList();
  }

  @override
  Future<OverallAttendance> getOverallAttendance() async {
    final attendance = await getAllAttendance();
    return OverallAttendance(attendance);
  }
}
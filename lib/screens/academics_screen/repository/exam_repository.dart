import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/models/exam.dart';
import 'package:campus_connect_v2/screens/auth_screen/repository/auth_repository.dart';

abstract class BaseExamRepository{
  final Logger _logger = Logger('AttendanceRepository');
  final HttpClient _httpClient = HttpClient();
  final String _baseUrl = 'http://localhost:8000/';
  final AuthenticationRepository authenticationRepository;

  BaseExamRepository(this.authenticationRepository);

  Future<List<Exam>> getAllExams();
  Future<Exam> getExamById(String id);
}

class ExamRepository extends BaseExamRepository{
  ExamRepository(super.authenticationRepository);
  @override
  Future<List<Exam>> getAllExams() async {
    final Header headers = Header();
    headers.addAll(await authenticationRepository.getAuthHeader());
    final response = await _httpClient.get('${_baseUrl}exam/', headers);
    final data = response['data'] as List;
    _logger.log(data.toString());
    return data.map((e) => Exam.fromJson(e)).toList();
  }

  @override
  Future<Exam> getExamById(String id) async {
    final Header headers = Header();
    headers.addAll(await authenticationRepository.getAuthHeader());
    final response = await _httpClient.get('${_baseUrl}exam/$id', headers);
    final data = response['data'];
    _logger.log(data.toString());
    return Exam.fromJson(data);
  }

}
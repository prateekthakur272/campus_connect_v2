import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/models/subject.dart';
import 'package:campus_connect_v2/screens/auth_screen/repository/auth_repository.dart';

abstract class BaseSubjectRepository{
  final Logger _logger = Logger('SubjectRepository');
  final HttpClient _httpClient = HttpClient();
  final String _baseUrl = 'http://localhost:8000/';
  final AuthenticationRepository authenticationRepository;

  BaseSubjectRepository(this.authenticationRepository);

  Future<List<Subject>> getAllSubjects();
  Future<Subject> getSubjectById(int id);
}

class SubjectRepository extends BaseSubjectRepository{

  SubjectRepository(super.authenticationRepository);

  @override
  Future<List<Subject>> getAllSubjects() async {
    final Header headers = Header();
    headers.addAll(await authenticationRepository.getAuthHeader());
    final Json response = await _httpClient.get('${_baseUrl}subject/', headers);
    final data = response['data'] as List;
    _logger.log(data.toString());
    return data.map((subject) => Subject.fromJson(subject)).toList();
  }

  @override
  Future<Subject> getSubjectById(int id) async {
    final Header headers = Header();
    headers.addAll(await authenticationRepository.getAuthHeader());
    final Json response = await _httpClient.get('${_baseUrl}subject/$id', headers);
    final data = response['data'] as Json;
    _logger.log(data.toString());
    return Subject.fromJson(data);
  }

}
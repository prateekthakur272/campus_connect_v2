import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:campus_connect_v2/screens/academics_screen/models/result.dart';
import 'package:campus_connect_v2/screens/auth_screen/repository/require_auth_repo.dart';

abstract class _BaseResultsRepository extends RequireAuth{
  final _logger = Logger('ResultsRepository');
  final HttpClient _httpClient = HttpClient();
  final _baseUrl = 'http://localhost:8000/';

  Future<List<Marks>> getAllMarks();
  Future<Marks> getMarks(String id);
  Future<List<Result>> getAllResults();
  Future<Result> getResult(String id);
}

class ResultsRepository extends _BaseResultsRepository{
  @override
  Future<List<Marks>> getAllMarks() async {
    final Json response = await _httpClient.get('${_baseUrl}marks', await authHeader);
    final data = response['data'] as List;
    final marks = data.map((m)=> Marks.fromJson(m)).toList();
    _logger.log(marks.toString());
    return marks;
  }

  @override
  Future<Marks> getMarks(String id) async {
    final Json response = await _httpClient.get('${_baseUrl}marks/$id', await authHeader);
    final marks = Marks.fromJson(response);
    _logger.log(marks.toString());
    return marks;
  }

  @override
  Future<List<Result>> getAllResults() async {
    final Json response = await _httpClient.get('${_baseUrl}result/', await authHeader);
    final data = response['data'] as List;
    final results = data.map((r)=> Result.fromJson(r)).toList();
    _logger.log(results.toString());
    return results;
  }

  @override
  Future<Result> getResult(String id) async {
    final Json response = await _httpClient.get('${_baseUrl}result/$id', await authHeader);
    final result = Result.fromJson(response['data']);
    _logger.log(result.toString());
    return result;
  }

}
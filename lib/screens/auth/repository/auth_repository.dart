import 'package:campus_connect_v2/core/hive_client/hive_client.dart';
import 'package:campus_connect_v2/core/http_client/api_client.dart';

abstract class _BaseAuthenticationRepository{
  Future<String> logIn(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logOut();
  Future<String?> getToken();
}

class AuthenticationRepository extends _BaseAuthenticationRepository{

  final HiveClient _hiveClient = HiveClient();
  final ApiClient _apiClient = ApiClient();

  @override
  Future<String> logIn(String email, String password) async {
    final res = await _apiClient.post('${_apiClient.baseUrl}auth/login/', {
      'username': email,
      'password': password
    });
    final token = res['token'];
    _hiveClient.saveToken(token);
    return token;
  }

  @override
  Future<void> logOut() async {
    await _hiveClient.deleteToken();
  }

  @override
  Future<void> register(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<String?> getToken() async {
    return await _hiveClient.getToken();
  }
}
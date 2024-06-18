import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/core/services/hive_service.dart';

abstract class _BaseAuthenticationRepository{
  Future<String> logIn(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logOut();
  Future<String?> getToken();
  Future<Header> getAuthHeader();
}

class AuthenticationRepository extends _BaseAuthenticationRepository{

  final HiveService _hiveClient = HiveService('user-data');
  final HttpClient _apiClient = HttpClient();
  final String _baseUrl = 'http://localhost:8000/';
  final String _keyToken = 'token';

  @override
  Future<String> logIn(String email, String password) async {
    final res = await _apiClient.post('${_baseUrl}auth/login/', {
      'username': email,
      'password': password
    });
    final token = res[_keyToken];
    _hiveClient.storeData(_keyToken, token);
    return token;
  }

  @override
  Future<void> logOut() async {
    await _hiveClient.deleteData(_keyToken);
  }

  @override
  Future<void> register(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<String?> getToken() async {
    return await _hiveClient.retrieveData(_keyToken);
  }

  @override
  Future<Header> getAuthHeader() async {
    final String token = await getToken()??'';
    return {'Authorization' : 'Token $token'};
  }
}
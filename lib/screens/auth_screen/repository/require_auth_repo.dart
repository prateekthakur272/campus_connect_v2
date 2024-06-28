import 'package:campus_connect_v2/core/api_client/typedefs.dart';
import 'package:campus_connect_v2/screens/auth_screen/repository/auth_repository.dart';

abstract class RequireAuth{
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  Future<Header> get authHeader => authenticationRepository.getAuthHeader();
}
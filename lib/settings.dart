import 'package:flutter_dotenv/flutter_dotenv.dart';

class Settings{
  static final appId = dotenv.env['appId']??'';
  static final appUrl = dotenv.env['appUrl']??'';
  static final baseUrl = dotenv.env['baseUrl'];
  static final clientApiBaseUrl = dotenv.env['clientApiBaseUrl']??'';
  static final dataApiBaseUrl = dotenv.env['dataApiBaseUrl']??'';
  static final dataExplorerLink = dotenv.env['dataExplorerLink']??'';
  static final dataSourceName = dotenv.env['dataSourceName']??'';
}
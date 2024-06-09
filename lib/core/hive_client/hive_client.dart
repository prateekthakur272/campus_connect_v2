import 'package:hive/hive.dart';

class HiveClient{
  static const _userDataBox = 'user-data';
  static const _keyToken = 'token';

  Future<Box> openBox() async {
    return await Hive.openBox(_userDataBox);
  }

  Future<void> saveToken(String token) async {
    final box = await openBox();
    await box.put(_keyToken, token);
  }

  Future<String?> getToken() async {
    final box = await openBox();
    return box.get(_keyToken);
  }

  Future<void> deleteToken() async {
    final box = await openBox();
    await box.delete(_keyToken);
  }

  Future<void> closeBox() async {
    final box = await openBox();
    await box.close();
  }
}
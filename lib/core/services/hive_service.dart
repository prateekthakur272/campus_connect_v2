import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String boxName;
  HiveService(this.boxName);
  
  // Initialize hive
  static Future<void> init() async {
    return await Hive.initFlutter();
  }

  // Open the box
  Future<Box> openBox() async {
    return await Hive.openBox(boxName);
  }

  // Store data in the box
  Future<void> storeData(String key, dynamic value) async {
    var box = await openBox();
    await box.put(key, value);
  }

  // Retrieve data from the box
  Future<dynamic> retrieveData(String key) async {
    var box = await openBox();
    return box.get(key);
  }

  // Delete data from box
  Future<void> deleteData(String key) async {
    var box = await openBox();
    return box.delete(key);
  }

  // Close the box
  Future<void> closeBox() async {
    var box = await Hive.openBox(boxName);
    await box.close();
  }
}

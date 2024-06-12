import 'dart:developer' as dev;

class Logger {
  final String name;
  Logger(this.name);

  void log(String message) {
    dev.log(message, name: name);
  }

  void error(Exception e){
    dev.log(e.toString(), name: name);
  }
}

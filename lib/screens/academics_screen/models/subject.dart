import 'package:flutter/foundation.dart';

@immutable
class Subject {
  final String name;
  final int id;
  final String code;

  const Subject(this.name, this.id, this.code);

  Subject copyWith({String? name, int? id, String? code}) {
    return Subject(
      name ?? this.name,
      id ?? this.id,
      code ?? this.code
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      json['attributes']['name'],
      int.tryParse(json['id'])??-1,
      json['attributes']['code']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'code': code
    };
  }

  @override
  String toString() {
    return 'Subject($id, $name, $code)';
  }
}

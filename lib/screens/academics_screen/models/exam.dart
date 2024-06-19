import 'package:campus_connect_v2/core/api_client/typedefs.dart';

class Exam {
  final String id;
  final String name;
  final DateTime examDate;
  final String departmentId;

  Exam({
    required this.id,
    required this.name,
    required this.examDate,
    required this.departmentId,
  });

  factory Exam.fromJson(Json json) {
    return Exam(
      id: json['id'],
      name: json['attributes']['name'],
      examDate: DateTime.parse(json['attributes']['exam_date']),
      departmentId: json['relationships']['department']['data']['id'],
    );
  }

  Json toJson() {
    return {
      'id': id,
      'attributes': {
        'name': name,
        'exam_date': examDate.toIso8601String(),
      },
      'relationships': {
        'department': {
          'data': {
            'type': 'Department',
            'id': departmentId,
          }
        }
      }
    };
  }

  Exam copyWith({
    String? id,
    String? name,
    DateTime? examDate,
    String? departmentId,
  }) {
    return Exam(
      id: id ?? this.id,
      name: name ?? this.name,
      examDate: examDate ?? this.examDate,
      departmentId: departmentId ?? this.departmentId,
    );
  }
}

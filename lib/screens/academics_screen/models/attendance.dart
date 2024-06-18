import 'package:flutter/foundation.dart';

@immutable
class SubjectAttendance {
  final int id;
  final int subjectId;
  final double attendance;

  const SubjectAttendance(this.id, this.subjectId, this.attendance);

  SubjectAttendance copyWith({int? id, int? subjectId, double? attendance}) {
    return SubjectAttendance(
      id ?? this.id,
      subjectId ?? this.subjectId,
      attendance ?? this.attendance,
    );
  }

  factory SubjectAttendance.fromJson(Map<String, dynamic> json) {
    return SubjectAttendance(
      json['id'],
      json['subject'],
      json['attendance'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subjectId,
      'attendance': attendance,
    };
  }
}

@immutable
class OverallAttendance {
  final List<SubjectAttendance> attendance;

  const OverallAttendance(this.attendance);

  OverallAttendance copyWith({List<SubjectAttendance>? attendance}) {
    return OverallAttendance(
      attendance ?? this.attendance,
    );
  }

  factory OverallAttendance.fromJson(Map<String, dynamic> json) {
    return OverallAttendance(
      (json['attendance'] as List)
          .map((e) => SubjectAttendance.fromJson(e))
          .toList(),
    );
  }

  double percentage(){
    double percentage = 0;
    attendance.forEach((element) {
      percentage += element.attendance;
    });
    return percentage/attendance.length/100;
  }

  Map<String, dynamic> toJson() {
    return {
      'attendance': attendance.map((e) => e.toJson()).toList(),
    };
  }
}

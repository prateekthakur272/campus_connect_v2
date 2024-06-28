import 'package:flutter/foundation.dart';

@immutable
class Marks {
  final String id;
  final String studentId;
  final String examId;
  final String subjectId;
  final double totalMarks;
  final double marks;

  const Marks(
      {required this.id,
        required this.studentId,
        required this.examId,
        required this.subjectId,
        required this.totalMarks,
        required this.marks});

  // fromJson factory constructor
  factory Marks.fromJson(Map<String, dynamic> json) {
    return Marks(
      id: json['id'].toString(),
      studentId: json['studentId'].toString(),
      examId: json['examId'].toString(),
      subjectId: json['subjectId'].toString(),
      totalMarks: (json['totalMarks']??0 as num).toDouble(),
      marks: (json['marks']??0 as num).toDouble(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'examId': examId,
      'subjectId': subjectId,
      'totalMarks': totalMarks,
      'marks': marks,
    };
  }

  // copyWith method
  Marks copyWith({
    String? id,
    String? studentId,
    String? examId,
    String? subjectId,
    double? totalMarks,
    double? marks,
  }) {
    return Marks(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      examId: examId ?? this.examId,
      subjectId: subjectId ?? this.subjectId,
      totalMarks: totalMarks ?? this.totalMarks,
      marks: marks ?? this.marks,
    );
  }
}

@immutable
class Result {
  final String id;
  final String examId;
  final String studentId;
  final List<Marks> marks;

  const Result(
      {required this.id,
        required this.examId,
        required this.studentId,
        required this.marks});

  // fromJson factory constructor
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      examId: json['relationships']['exam']['data']['id'],
      studentId: json['relationships']['student']['data']['id'],
      marks: (json['relationships']['marks']['data'] as List)
          .map((item) => Marks.fromJson(item))
          .toList(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'examId': examId,
      'studentId': studentId,
      'marks': marks.map((mark) => mark.toJson()).toList(),
    };
  }

  // copyWith method
  Result copyWith({
    String? id,
    String? examId,
    String? studentId,
    List<Marks>? marks,
  }) {
    return Result(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      studentId: studentId ?? this.studentId,
      marks: marks ?? this.marks,
    );
  }
}

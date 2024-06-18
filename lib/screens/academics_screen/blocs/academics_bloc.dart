import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:campus_connect_v2/screens/academics_screen/models/models.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/attendance_repository.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/subject_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AcademicStatus {
  initial,
  loading,
  success,
  failed,
}

// State
class AcademicsState extends Equatable {
  final AcademicStatus status;
  final List<Subject>? subjects;
  final OverallAttendance? attendance;
  final String? errorMessage;

  const AcademicsState(
      {required this.status,
      this.subjects,
      this.attendance,
      this.errorMessage});

  AcademicsState copyWith(
      {AcademicStatus? status,
      List<Subject>? subjects,
      OverallAttendance? attendance,
      String? errorMessage}) {
    return AcademicsState(
        status: status ?? this.status,
        subjects: subjects ?? this.subjects,
        attendance: attendance ?? this.attendance,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, subjects, attendance, errorMessage];
}

// Events
class AcademicsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAcademicsData extends AcademicsEvent {}

// Bloc
class AcademicsBloc extends Bloc<AcademicsEvent, AcademicsState> {
  final AttendanceRepository _attendanceRepository;
  final SubjectRepository _subjectRepository;
  AcademicsBloc(
      {required AttendanceRepository attendanceRepository,
      required SubjectRepository subjectRepository})
      : _attendanceRepository = attendanceRepository,
        _subjectRepository = subjectRepository,
        super(const AcademicsState(status: AcademicStatus.initial)) {
    on<LoadAcademicsData>((event, emit) async {
      emit(state.copyWith(status: AcademicStatus.loading));
      try {
        final subjects = await _subjectRepository.getAllSubjects();
        final attendance = await _attendanceRepository.getOverallAttendance();
        emit(state.copyWith(
            status: AcademicStatus.success,
            subjects: subjects,
            attendance: attendance));
      } on HttpClientException catch (e) {
        logger.log(e.toString());
        emit(state.copyWith(
            status: AcademicStatus.failed, errorMessage: e.message));
      }
    });
  }
}

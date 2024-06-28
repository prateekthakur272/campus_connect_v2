import 'package:campus_connect_v2/screens/academics_screen/repository/attendance_repository.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/exam_repository.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/results_repository.dart';
import 'package:campus_connect_v2/screens/academics_screen/repository/subject_repository.dart';
import 'package:campus_connect_v2/screens/auth_screen/repository/auth_repository.dart';

class AcademicsRepository{
  final AuthenticationRepository authenticationRepository;
  late final ExamRepository examRepository;
  late final ResultsRepository resultsRepository;
  late final AttendanceRepository attendanceRepository;
  late final SubjectRepository subjectRepository;

  AcademicsRepository(this.authenticationRepository){
    examRepository = ExamRepository(authenticationRepository);
    resultsRepository = ResultsRepository();
    attendanceRepository = AttendanceRepository();
    subjectRepository = SubjectRepository(authenticationRepository);
  }
}
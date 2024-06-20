import 'package:campus_connect_v2/screens/academics_screen/blocs/academics_bloc.dart';
import 'package:campus_connect_v2/screens/academics_screen/widgets/attendance_card.dart';
import 'package:campus_connect_v2/screens/academics_screen/widgets/exams_card.dart';
import 'package:campus_connect_v2/shared/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triton_extensions/triton_extensions.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AcademicsBloc>().add(LoadAcademicsData());
    return BlocBuilder<AcademicsBloc, AcademicsState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text(AppConstants.textTitleAcademics),
              ),
          body: ListView(
            padding: 16.padding,
            children: const [AttendanceCard(), ExamsCard()],
          ),
            ));
  }
}

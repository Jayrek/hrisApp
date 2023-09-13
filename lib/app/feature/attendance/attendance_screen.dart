import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/bloc/attendance/attendance_bloc.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  void initState() {
    final formatter = DateFormat('yyyy-MM-dd');
    final initialDate = formatter.format(DateTime.now());

    context.read<AttendanceBloc>().add(
          AttendanceFetched(
            dateFrom: initialDate.toString(),
            dateTo: initialDate.toString(),
          ),
        );
    super.initState();
  }

  String getCurrentDate() {
    final formatter = DateFormat.yMMMMEEEEd();
    return formatter.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'ATTENDANCE',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidet(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'SHIFT & SCHEDULE',
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                getCurrentDate().toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

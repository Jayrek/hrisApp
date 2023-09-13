import 'dart:async';

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
  late Stream<DateTime> _timeStream;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    final formatter = DateFormat('yyyy-MM-dd');
    final initialDate = formatter.format(DateTime.now());

    context.read<AttendanceBloc>().add(
          AttendanceFetched(
            dateFrom: initialDate.toString(),
            dateTo: initialDate.toString(),
          ),
        );

    _timeStream = Stream.periodic(Duration(seconds: 1), (_) => DateTime.now());
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
              StreamBuilder<DateTime>(
                  stream: _timeStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _currentTime = snapshot.data!;
                    }
                    final formattedTime =
                        DateFormat('hh:mm:ss').format(_currentTime);
                    return Container(
                      color: Colors.black,
                      height: 50,
                      child: Center(
                        child: Text(
                          formattedTime,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.yellow.shade200,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'AM IN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'PM OUT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildShiftScheduleTable(){
  //   return TableRow(children: );
  // }
}

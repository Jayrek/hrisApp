import 'package:flutter/material.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'ATTENDANCE',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),),
      drawer: const DrawerWidet(),
      body: Center(
        child: Text('attendance'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'PERSONAL',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),),
      drawer: const DrawerWidet(),
      body: Center(
        child: Text('personal'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'CHANGE PASSWORD',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text(
          'COMING SOON!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

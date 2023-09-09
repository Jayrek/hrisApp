import 'package:flutter/material.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'LEAVES',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),),
      drawer: const DrawerWidet(),
      body: Center(
        child: Text('leaves'),
      ),
    );
  }
}

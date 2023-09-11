import 'package:flutter/material.dart';

class LeavesRequestScreen extends StatelessWidget {
  const LeavesRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'LEAVE REQUEST',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
            },
            child:const Text('Clear'),
          ),
        ],
      ),
      body: Center(
        child: Text('Leaves Request'),
      ),
    );
  }
}

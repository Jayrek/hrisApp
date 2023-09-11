import 'package:flutter/material.dart';

class LeavesDetailScreen extends StatelessWidget {
  const LeavesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'LEAVE DETAIL',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text('Leaves Detail'),
      ),
    );
  }
}

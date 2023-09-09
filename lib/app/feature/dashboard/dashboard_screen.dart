import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/router/app_route.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var toolbarTitle = 'PERSONAL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          toolbarTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      drawer: const DrawerWidet(),
      body: Center(
        child: Text(
          '$toolbarTitle SCREEN',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

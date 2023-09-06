import 'package:flutter/material.dart';
import 'package:rgs_hris/app_router.dart';

void main() {
  runApp(const RgsHrisApp());
}

class RgsHrisApp extends StatelessWidget {
  const RgsHrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Lato'
      ),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}

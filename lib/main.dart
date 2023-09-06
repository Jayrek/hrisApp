import 'package:flutter/material.dart';
import 'package:rgs_hris/router/app_router_config.dart';

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
      routeInformationProvider: AppRouterConfig.router.routeInformationProvider,
      routeInformationParser: AppRouterConfig.router.routeInformationParser,
      routerDelegate: AppRouterConfig.router.routerDelegate,
    );
  }
}

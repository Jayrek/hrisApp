import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/core/domain/manager/shared_prefs_manager.dart';
import 'package:rgs_hris/router/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    _checkIsLoggedIn(router);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  Future<void> _checkIsLoggedIn(GoRouter router) async {
    final token = await SharedPrefsManager().getToken();
    // await Future.delayed(const Duration(seconds: 2));

    if (token.isNotEmpty) {
      router.pushReplacementNamed(AppRoute.attendance.name);
    } else {
      router.pushReplacementNamed(AppRoute.signIn.name);
    }
  }
}

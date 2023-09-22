import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../router/app_route.dart';
import '../../common/util/key_strings.dart';

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
    final tokenValue =
        await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);

    if (tokenValue.isNotEmpty) {
      router.pushReplacementNamed(AppRoute.attendance.name);
    } else {
      router.pushReplacementNamed(AppRoute.signIn.name);
    }
  }
}

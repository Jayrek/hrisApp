import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_in/sign_in_screen.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_up/sign_up_screen.dart';
import 'package:rgs_hris/app/feature/dashboard/dashboard_screen.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(routes: <RouteBase>[
    // GoRoute(
    //   name: 'dashboard',
    //   path: '/',
    //   builder: (_, __) => const DashboardScreen(),
    // )
    GoRoute(
        name: 'signIn',
        path: '/',
        builder: (_, __) => const SignInScreen(),
        routes: <RouteBase>[
          GoRoute(
            name: 'dashboard',
            path: 'dashboard',
            builder: (_, __) => const DashboardScreen(),
          ),
          GoRoute(
            name: 'signUp',
            path: 'signUp',
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: const SignUpScreen(),
            ),
          )
        ])
  ]);

  static CustomTransitionPage pageBuilderAnimate(
          BuildContext context, GoRouterState state,
          {required Widget child}) =>
      CustomTransitionPage(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,);
          });
}

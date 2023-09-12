import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_in/sign_in_screen.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_up/sign_up_screen.dart';
import 'package:rgs_hris/app/feature/change_password/change_password_screen.dart';
import 'package:rgs_hris/app/feature/dashboard/dashboard_screen.dart';
import 'package:rgs_hris/app/feature/employment/employment_screen.dart';
import 'package:rgs_hris/app/feature/handbook/handbook_screen.dart';
import 'package:rgs_hris/app/feature/leaves/leaves_detail_screen.dart';
import 'package:rgs_hris/app/feature/leaves/leaves_request_screen.dart';
import 'package:rgs_hris/app/feature/my_access/my_access_screen.dart';
import 'package:rgs_hris/app/feature/performance/performance_screen.dart';
import 'package:rgs_hris/app/feature/personal/personal_screen.dart';
import 'package:rgs_hris/app/feature/request_update/request_update_screen.dart';
import 'package:rgs_hris/app/feature/work/work_screen.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../app/feature/attendance/attendance_screen.dart';
import '../app/feature/documents/documents_screen.dart';
import '../app/feature/leaves/leaves_screen.dart';
import '../core/data/model/response/leave_applications_response.dart';

class AppRouterConfig {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(routes: <RouteBase>[
    // GoRoute(
    //   name: 'dashboard',
    //   path: '/',
    //   builder: (_, __) => const DashboardScreen(),
    // )
    GoRoute(
        name: AppRoute.signIn.name,
        path: AppRoute.signIn.path,
        builder: (_, __) => SignInScreen(),
        routes: <RouteBase>[
          GoRoute(
            name: AppRoute.dashboard.name,
            path: AppRoute.dashboard.path,
            builder: (_, __) => const DashboardScreen(),
            routes: [
              GoRoute(
                name: AppRoute.personal.name,
                path: AppRoute.personal.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const PersonalScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.employment.name,
                path: AppRoute.employment.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const EmploymentScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.work.name,
                path: AppRoute.work.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const WorkScreen(),
                ),
              ),
              GoRoute(
                  name: AppRoute.leaves.name,
                  path: AppRoute.leaves.path,
                  pageBuilder: (context, state) => pageBuilderAnimate(
                        context,
                        state,
                        child: LeavesScreen(),
                      ),
                  routes: [
                    GoRoute(
                        name: AppRoute.leaveDetail.name,
                        path: AppRoute.leaveDetail.path,
                        pageBuilder: (context, state) {
                          LeaveApplications leaveApplication =
                              state.extra as LeaveApplications;
                          return pageBuilderAnimate(
                            context,
                            state,
                            child: LeavesDetailScreen(
                              leaveApplications: leaveApplication,
                            ),
                          );
                        }),
                    GoRoute(
                      name: AppRoute.leavesRequest.name,
                      path: AppRoute.leavesRequest.path,
                      pageBuilder: (context, state) => pageBuilderAnimate(
                        context,
                        state,
                        child: const LeavesRequestScreen(),
                      ),
                    ),
                  ]),
              GoRoute(
                name: AppRoute.attendance.name,
                path: AppRoute.attendance.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const AttendanceScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.performance.name,
                path: AppRoute.performance.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const PerformanceScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.documents.name,
                path: AppRoute.documents.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const DocumentsScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.handbook.name,
                path: AppRoute.handbook.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const HandBookScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.requestUpdate.name,
                path: AppRoute.requestUpdate.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const RequestUpdateScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.myAccess.name,
                path: AppRoute.myAccess.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const MyAccessScreen(),
                ),
              ),
              GoRoute(
                name: AppRoute.changePassword.name,
                path: AppRoute.changePassword.path,
                pageBuilder: (context, state) => pageBuilderAnimate(
                  context,
                  state,
                  child: const ChangePasswordScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoute.signUp.name,
            path: AppRoute.signUp.path,
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: SignUpScreen(),
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
              child: child,
            );
          });
}

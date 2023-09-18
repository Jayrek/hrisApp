import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_in/sign_in_screen.dart';
import 'package:rgs_hris/app/feature/authentication/auth/sign_up/sign_up_screen.dart';
import 'package:rgs_hris/app/feature/my_access/my_access_change_password/my_access_change_password_screen.dart';
import 'package:rgs_hris/app/feature/employment/employment_screen.dart';
import 'package:rgs_hris/app/feature/handbook/handbook_screen.dart';
import 'package:rgs_hris/app/feature/leaves/leaves_detail_screen.dart';
import 'package:rgs_hris/app/feature/leaves/leaves_request_screen.dart';
import 'package:rgs_hris/app/feature/my_access/my_access_change_username/my_access_change_user_name_screen.dart';
import 'package:rgs_hris/app/feature/my_access/my_access_profile/my_access_profile_screen.dart';
import 'package:rgs_hris/app/feature/performance/performance_goals_screen.dart';
import 'package:rgs_hris/app/feature/performance/performance_profile_screen.dart';
import 'package:rgs_hris/app/feature/performance/performance_screen.dart';
import 'package:rgs_hris/app/feature/personal/personal_screen.dart';
import 'package:rgs_hris/app/feature/request_update/request_update_screen.dart';
import 'package:rgs_hris/app/feature/splash/splash_screen.dart';
import 'package:rgs_hris/app/feature/work/work_screen.dart';
import 'package:rgs_hris/core/data/model/response/leaves_data_response.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../app/feature/attendance/attendance_detail_screen.dart';
import '../app/feature/attendance/attendance_screen.dart';
import '../app/feature/documents/documents_screen.dart';
import '../app/feature/leaves/leaves_screen.dart';
import '../core/data/model/response/attendance_list_response.dart';
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
        name: AppRoute.splash.name,
        path: AppRoute.splash.path,
        builder: (_, __) => const SplashScreen(),
        routes: [
          GoRoute(
            name: AppRoute.signIn.name,
            path: AppRoute.signIn.path,
            builder: (_, __) => SignInScreen(),
          ),
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
                    child: const LeavesScreen(),
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
                    pageBuilder: (context, state) {
                      LeavesDataResponse leaveDataResponse =
                          state.extra as LeavesDataResponse;
                      return pageBuilderAnimate(
                        context,
                        state,
                        child: LeavesRequestScreen(
                          leavesDataResponse: leaveDataResponse,
                        ),
                      );
                    }),
              ]),
          GoRoute(
              name: AppRoute.attendance.name,
              path: AppRoute.attendance.path,
              pageBuilder: (context, state) => pageBuilderAnimate(
                    context,
                    state,
                    child: AttendanceScreen(),
                  ),
              routes: [
                GoRoute(
                    name: AppRoute.attendanceDetail.name,
                    path: AppRoute.attendanceDetail.path,
                    pageBuilder: (context, state) {
                      AttendanceListResponse attendanceListResponse =
                          state.extra as AttendanceListResponse;
                      return pageBuilderAnimate(
                        context,
                        state,
                        child: AttendanceDetailScreen(
                            attendanceListResponse: attendanceListResponse),
                      );
                    }),
              ]),
          GoRoute(
              name: AppRoute.performance.name,
              path: AppRoute.performance.path,
              pageBuilder: (context, state) => pageBuilderAnimate(
                    context,
                    state,
                    child: const PerformanceScreen(),
                  ),
              routes: [
                GoRoute(
                  name: AppRoute.performanceProfile.name,
                  path: AppRoute.performanceProfile.path,
                  pageBuilder: (context, state) => pageBuilderAnimate(
                    context,
                    state,
                    child: const PerformanceProfileScreen(),
                  ),
                ),
                GoRoute(
                  name: AppRoute.performanceGoals.name,
                  path: AppRoute.performanceGoals.path,
                  pageBuilder: (context, state) => pageBuilderAnimate(
                    context,
                    state,
                    child: const PerformanceGoalsScreen(),
                  ),
                ),
              ]),
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
            name: AppRoute.myAccessProfile.name,
            path: AppRoute.myAccessProfile.path,
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: const MyAccessProfileScreen(),
            ),
          ),
          GoRoute(
            name: AppRoute.myAccessChangePassword.name,
            path: AppRoute.myAccessChangePassword.path,
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: const MyAccessChangePasswordScreen(),
            ),
          ),
          GoRoute(
            name: AppRoute.myAccessChangeUserName.name,
            path: AppRoute.myAccessChangeUserName.path,
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: MyAccessChangeUserNameScreen(),
            ),
          ),
          //   ],
          // ),
          GoRoute(
            name: AppRoute.signUp.name,
            path: AppRoute.signUp.path,
            pageBuilder: (context, state) => pageBuilderAnimate(
              context,
              state,
              child: SignUpScreen(),
            ),
          )
        ]),
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

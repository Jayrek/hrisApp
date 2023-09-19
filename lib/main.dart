import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/app/bloc/attendance/attendance_bloc.dart';
import 'package:rgs_hris/app/bloc/auth/auth_bloc.dart';
import 'package:rgs_hris/app/bloc/change_request/change_request_bloc.dart';
import 'package:rgs_hris/app/bloc/employee/employee_bloc.dart';
import 'package:rgs_hris/app/bloc/leaves/leaves_bloc.dart';
import 'package:rgs_hris/app/bloc/my_access/my_access_bloc.dart';
import 'package:rgs_hris/app/bloc/user/user_bloc.dart';
import 'package:rgs_hris/app/bloc/work/work_bloc.dart';
import 'package:rgs_hris/core/data/data_source/attendance/attendance_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/auth/auth_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/leaves/leaves_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/performance/performance_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/user/user_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/work/work_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/repository/auth/auth_repository_impl.dart';
import 'package:rgs_hris/core/data/repository/leaves/leaves_repository_impl.dart';
import 'package:rgs_hris/core/data/repository/user/user_repository_impl.dart';
import 'package:rgs_hris/core/data/repository/work/work_repository_impl.dart';
import 'package:rgs_hris/router/app_router_config.dart';

import 'app/bloc/performance/performance_bloc.dart';
import 'app/bloc/time_in_out/time_in_out_bloc.dart';
import 'core/data/data_source/change_request/change_request_remote_data_source_impl.dart';
import 'core/data/data_source/my_access/my_access_remote_data_source_impl.dart';
import 'core/data/repository/change_request/change_request_repository_impl.dart';
import 'core/data/repository/my_access/my_access_repository_impl.dart';
import 'core/data/repository/performance/performance_repository_impl.dart';
import 'core/domain/manager/shared_prefs_manager.dart';
import 'core/data/data_source/employee/employee_remote_data_source_impl.dart';
import 'core/data/repository/attendance/attendance_repository_impl.dart';
import 'core/data/repository/employee/employee_repository_impl.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();
  await SharedPrefsManager.init();
  runApp(const RgsHrisApp());
}

class RgsHrisApp extends StatelessWidget {
  const RgsHrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            final authRemoteDataSource =
                AuthRemoteDataSourceImpl(dioClient: Dio());
            return AuthRepositoryImpl(
                authRemoteDataSource: authRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final leavesRemoteDataSource =
                LeavesRemoteDataSourceImpl(dioClient: Dio());

            return LeavesRepositoryImpl(
                leavesRemoteDataSource: leavesRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final attendanceRemoteDataSource =
                AttendanceRemoteDataSourceImpl(dioClient: Dio());

            return AttendanceRepositoryImpl(
                attendanceRemoteDataSource: attendanceRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final userRemoteDataSource =
                UserRemoteDataSourceImpl(dioClient: Dio());

            return UserRepositoryImpl(
                userRemoteDataSource: userRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final workRemoteDataSource =
                WorkRemoteDataSourceImpl(dioClient: Dio());

            return WorkRepositoryImpl(
                workRemoteDataSource: workRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final employeeRemoteDataSource =
                EmployeeRemoteDataSourceImpl(dioClient: Dio());

            return EmployeeRepositoryImpl(
                employeeRemoteDataSource: employeeRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final myAccessRemoteDataSource =
                MyAccessRemoteDataSourceImpl(dioClient: Dio());

            return MyAccessRepositoryImpl(
                myAccessRemoteDataSource: myAccessRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final performanceRemoteDataSource =
                PerformanceRemoteDataSourceImpl(dioClient: Dio());

            return PerformanceRepositoryImpl(
                performanceRemoteDataSource: performanceRemoteDataSource);
          },
        ),
        RepositoryProvider(
          create: (context) {
            final changeRequestRemoteDataSource =
                ChangeRequestRemoteDataSourceImpl(dioClient: Dio());

            return ChangeRequestRepositoryImpl(
                changeRequestRemoteDataSource: changeRequestRemoteDataSource);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository:
                    RepositoryProvider.of<AuthRepositoryImpl>(context),
                leavesRepository:
                    RepositoryProvider.of<LeavesRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => LeavesBloc(
                leavesRepository:
                    RepositoryProvider.of<LeavesRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => AttendanceBloc(
                attendanceRepository:
                    RepositoryProvider.of<AttendanceRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => UserBloc(
                userRepository:
                    RepositoryProvider.of<UserRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => TimeInOutBloc(
                attendanceRepository:
                    RepositoryProvider.of<AttendanceRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => WorkBloc(
                workRepository:
                    RepositoryProvider.of<WorkRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => EmployeeBloc(
                employeeRepository:
                    RepositoryProvider.of<EmployeeRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => MyAccessBloc(
                myAccessRepository:
                    RepositoryProvider.of<MyAccessRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => PerformanceBloc(
                performanceRepository:
                    RepositoryProvider.of<PerformanceRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => ChangeRequestBloc(
                changeRequestRepository:
                    RepositoryProvider.of<ChangeRequestRepositoryImpl>(
                        context)),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(fontFamily: 'Lato'),
          debugShowCheckedModeBanner: false,
          routeInformationProvider:
              AppRouterConfig.router.routeInformationProvider,
          routeInformationParser: AppRouterConfig.router.routeInformationParser,
          routerDelegate: AppRouterConfig.router.routerDelegate,
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/app/bloc/auth/auth_bloc.dart';
import 'package:rgs_hris/app/bloc/leaves/leaves_profile/leaves_profile_bloc.dart';
import 'package:rgs_hris/core/data/data_source/auth/auth_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/data_source/leaves/leaves_remote_data_source_impl.dart';
import 'package:rgs_hris/core/data/repository/auth/auth_repository_impl.dart';
import 'package:rgs_hris/core/data/repository/leaves/leaves_repository_impl.dart';
import 'package:rgs_hris/router/app_router_config.dart';

void main() {
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
            create: (context) => LeavesProfileBloc(
                leavesRepository:
                    RepositoryProvider.of<LeavesRepositoryImpl>(context)),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
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

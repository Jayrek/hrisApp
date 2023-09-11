import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/login_wrapper_response.dart';
import 'package:rgs_hris/core/domain/manager/token_manager.dart';
import 'package:rgs_hris/core/domain/repository/auth/auth_repository.dart';
import 'package:rgs_hris/core/domain/repository/leaves/leaves_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final LeavesRepository leavesRepository;

  AuthBloc({required this.authRepository, required this.leavesRepository})
      : super(AuthInitial()) {
    on<AuthSignInSubmit>(_authSignInSubmit);
  }

  FutureOr<void> _authSignInSubmit(
    AuthSignInSubmit event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await authRepository.signInUser(
      username: event.username,
      password: event.password,
    );

    debugPrint('response: $response');

    final loginResponse = response.loginResponse;
    String? token = '';
    if (loginResponse != null) {
      token = loginResponse.loginDataResponse?.token.toString();
      await TokenManager.setToken(token.toString());
    }


    emit(AuthSignInSuccess(response));
  }
}

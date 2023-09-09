import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/login_response.dart';
import 'package:rgs_hris/core/domain/repository/auth/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
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

    emit(AuthSignInSuccess(response));
  }
}

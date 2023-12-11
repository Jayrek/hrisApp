import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/remote/model/response/login_wrapper_response.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../core/domain/repository/auth/auth_repository.dart';
import '../../../core/domain/repository/leaves/leaves_repository.dart';
import '../../common/util/key_strings.dart';

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
    try {
      final response = await authRepository.signInUser(
        username: event.username,
        password: event.password,
      );

      final loginResponse = response.loginResponse;

      if (loginResponse != null) {
        if (loginResponse.loginDataResponse != null) {
          String? token = loginResponse.loginDataResponse?.token.toString();
          String? fullName =
              loginResponse.loginDataResponse?.employeeDetails?.name.toString();
          SharedPrefsManager()
              .setStringPref(KeyStrings.spTokenKey, token.toString());
          SharedPrefsManager()
              .setStringPref(KeyStrings.spFullNameKey, fullName.toString());
          emit(AuthSignInSuccess(response));
        } else {
          emit(AuthSignInException(
              message: loginResponse.message ?? 'Unknown error'));
        }
      }
    } catch (e) {
      emit(AuthSignInException(message: e.toString()));
    }
  }
}

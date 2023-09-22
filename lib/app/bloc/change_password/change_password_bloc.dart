import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/remote/model/response/wrapper_default_response.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../core/domain/repository/my_access/my_access_repository.dart';
import '../../common/util/key_strings.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final MyAccessRepository myAccessRepository;

  ChangePasswordBloc({required this.myAccessRepository})
      : super(ChangePasswordInitial()) {
    on<ChangePasswordSubmit>(_onChangePasswordSubmit);
  }

  FutureOr<void> _onChangePasswordSubmit(
    ChangePasswordSubmit event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await myAccessRepository.changePassword(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
          token: tokenValue);

      emit(
        ChangePasswordLoaded(wrapperDefaultResponse: response),
      );
    } catch (e) {
      emit(ChangePasswordException(message: e.toString()));
    }
  }
}

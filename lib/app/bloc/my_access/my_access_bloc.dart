import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/remote/model/response/my_access_wrapper_response.dart';
import '../../../core/remote/model/response/wrapper_default_response.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../core/domain/repository/my_access/my_access_repository.dart';
import '../../common/util/key_strings.dart';

part 'my_access_event.dart';

part 'my_access_state.dart';

class MyAccessBloc extends Bloc<MyAccessEvent, MyAccessState> {
  final MyAccessRepository myAccessRepository;

  MyAccessBloc({required this.myAccessRepository})
      : super(const MyAccessState()) {
    on<MyAccessFetched>(_onMyAccessFetched);
    on<MyAccessChangePasswordSubmit>(_onMyAccessChangePasswordSubmit);
  }

  FutureOr<void> _onMyAccessFetched(
    MyAccessFetched event,
    Emitter<MyAccessState> emit,
  ) async {
    emit(state.copyWith(myAccessStatus: MyAccessStatus.loading));
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response =
          await myAccessRepository.getMyAccessInformation(token: tokenValue);

      emit(state.copyWith(
          myAccessStatus: MyAccessStatus.success,
          myAccessWrapperResponse: response,
          changePasswordWrapperResponse: null));
    } catch (e) {
      emit(state.copyWith(
        myAccessStatus: MyAccessStatus.failure,
      ));
    }
  }

  FutureOr<void> _onMyAccessChangePasswordSubmit(
    MyAccessChangePasswordSubmit event,
    Emitter<MyAccessState> emit,
  ) async {
    emit(state.copyWith(myAccessStatus: MyAccessStatus.loading));
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await myAccessRepository.changePassword(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
          token: tokenValue);

      emit(state.copyWith(
        myAccessStatus: MyAccessStatus.success,
        changePasswordWrapperResponse: response,
        isPasswordSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        myAccessStatus: MyAccessStatus.failure,
      ));
    }
  }
}

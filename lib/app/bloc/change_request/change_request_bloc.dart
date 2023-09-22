import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/response/change_request_wrapper_response.dart';
import '../../../core/data/model/response/wrapper_default_response.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../core/domain/repository/change_request/change_request_repository.dart';
import '../../common/util/key_strings.dart';

part 'change_request_event.dart';

part 'change_request_state.dart';

class ChangeRequestBloc extends Bloc<ChangeRequestEvent, ChangeRequestState> {
  final ChangeRequestRepository changeRequestRepository;

  ChangeRequestBloc({required this.changeRequestRepository})
      : super(ChangeRequestInitial()) {
    on<ChangeRequestFetched>(_onChangeRequestFetched);
    on<ChangeRequestSet>(_onChangeRequestSet);
  }

  FutureOr<void> _onChangeRequestFetched(
    ChangeRequestFetched event,
    Emitter<ChangeRequestState> emit,
  ) async {
    emit(ChangeRequestLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await changeRequestRepository
          .getChangeRequestInformation(status: event.status, token: tokenValue);
      emit(ChangeRequestLoaded(changeRequestWrapperResponse: response));
    } catch (e) {
      emit(ChangeRequestException(message: e.toString()));
    }
  }

  FutureOr<void> _onChangeRequestSet(
    ChangeRequestSet event,
    Emitter<ChangeRequestState> emit,
  ) async {
    emit(ChangeRequestLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await changeRequestRepository.setChangeRequest(
          category: event.category,
          oldData: event.oldData,
          newData: event.newData,
          token: tokenValue);
      emit(ChangeRequestSetLoaded(wrapperDefaultResponse: response));
    } catch (e) {
      emit(ChangeRequestException(message: e.toString()));
    }
  }
}

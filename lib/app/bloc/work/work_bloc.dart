import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/works_wrapper_response.dart';

import '../../../core/domain/repository/work/work_repository.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../common/util/key_strings.dart';

part 'work_event.dart';

part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final WorkRepository workRepository;

  WorkBloc({required this.workRepository}) : super(WorkInitial()) {
    on<WorkFetched>(_onWorkFetched);
  }

  FutureOr<void> _onWorkFetched(
    WorkFetched event,
    Emitter<WorkState> emit,
  ) async {
    emit(WorkLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response =
          await workRepository.getWorkInformation(token: tokenValue);

      emit(WorkLoaded(worksWrapperResponse: response));
    } catch (e) {
      emit(WorkException(message: e.toString()));
    }
  }
}

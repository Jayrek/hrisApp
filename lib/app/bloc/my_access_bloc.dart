import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rgs_hris/core/data/model/response/my_access_wrapper_response.dart';
import 'package:rgs_hris/core/domain/manager/shared_prefs_manager.dart';

import '../../core/domain/repository/my_access/my_access_repository.dart';

part 'my_access_event.dart';

part 'my_access_state.dart';

class MyAccessBloc extends Bloc<MyAccessEvent, MyAccessState> {
  final MyAccessRepository myAccessRepository;

  MyAccessBloc({required this.myAccessRepository}) : super(const MyAccessState()) {
    on<MyAccessFetched>(_onMyAccessFetched);
  }

  FutureOr<void> _onMyAccessFetched(
    MyAccessFetched event,
    Emitter<MyAccessState> emit,
  ) async {
    emit(state.copyWith(myAccessStatus: MyAccessStatus.loading));
    try {
      final tokenValue = await SharedPrefsManager().getToken();
      final response =
          await myAccessRepository.getMyAccessInformation(token: tokenValue);

      emit(state.copyWith(
        myAccessStatus: MyAccessStatus.success,
        myAccessWrapperResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        myAccessStatus: MyAccessStatus.failure,
      ));
    }
  }
}

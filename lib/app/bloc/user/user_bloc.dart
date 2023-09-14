import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/personal_wrapper_response.dart';

import '../../../core/domain/manager/token_manager.dart';
import '../../../core/domain/repository/user/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserFetched>(_onPersonalFetched);
  }

  FutureOr<void> _onPersonalFetched(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    final tokenValue = await TokenManager.getToken();
    final response =
        await userRepository.getPersonalInformation(token: tokenValue);

    print('personalResponse $response');
    emit(UserLoaded(personalWrapperResponse: response));
  }
}

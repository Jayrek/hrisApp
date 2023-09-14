import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/response/employees_wrapper_response.dart';
import '../../../core/domain/manager/token_manager.dart';
import '../../../core/domain/repository/employee/employee_repository.dart';

part 'employee_event.dart';

part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository employeeRepository;

  EmployeeBloc({required this.employeeRepository}) : super(EmployeeInitial()) {
    on<EmployeeEvent>(_onEmployeeFetched);
  }

  FutureOr<void> _onEmployeeFetched(
    EmployeeEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    final tokenValue = await TokenManager.getToken();
    final response =
        await employeeRepository.getEmployeeInformation(token: tokenValue);

    print('_onEmployeeFetched: $response');
    emit(EmployeeLoaded(worksWrapperResponse: response));
  }
}
part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final EmployeesWrapperResponse worksWrapperResponse;

  const EmployeeLoaded({required this.worksWrapperResponse});

  @override
  List<Object> get props => [];
}

class EmployeeException extends EmployeeState {
  final String message;

  const EmployeeException({required this.message});

  @override
  List<Object> get props => [message];
}

part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordLoaded extends ChangePasswordState {
  final WrapperDefaultResponse wrapperDefaultResponse;

  const ChangePasswordLoaded({required this.wrapperDefaultResponse});

  @override
  List<Object> get props => [wrapperDefaultResponse];
}

class ChangePasswordException extends ChangePasswordState {
  final String message;

  const ChangePasswordException({required this.message});

  @override
  List<Object> get props => [message];
}

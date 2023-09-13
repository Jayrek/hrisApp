part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final PersonalWrapperResponse personalWrapperResponse;

  const UserLoaded({required this.personalWrapperResponse});

  @override
  List<Object> get props => [personalWrapperResponse];
}

class UserException extends UserState {
  final String message;

  const UserException({required this.message});

  @override
  List<Object> get props => [message];
}

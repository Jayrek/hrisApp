part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {
  final LoginWrapperResponse loginWrapperResponse;

  const AuthSignInSuccess(this.loginWrapperResponse);

  @override
  List<Object> get props => [loginWrapperResponse];
}

class AuthSignInException extends AuthState {
  final String message;

  const AuthSignInException({required this.message});

  @override
  List<Object> get props => [message];
}

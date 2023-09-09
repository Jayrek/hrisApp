part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {
  final LoginResponse loginResponse;

  const AuthSignInSuccess(this.loginResponse);

  @override
  List<Object> get props => [loginResponse];
}

class AuthSignInException extends AuthState {}

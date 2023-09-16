part of 'my_access_bloc.dart';

abstract class MyAccessState extends Equatable {
  const MyAccessState();

  @override
  List<Object> get props => [];
}

class MyAccessInitial extends MyAccessState {}

class MyAccessLoading extends MyAccessState {}

class MyAccessLoaded extends MyAccessState {
  final MyAccessWrapperResponse myAccessWrapperResponse;

  const MyAccessLoaded({required this.myAccessWrapperResponse});

  @override
  List<Object> get props => [MyAccessLoaded];
}

class MyAccessException extends MyAccessState {
  final String message;

  const MyAccessException({required this.message});

  @override
  List<Object> get props => [message];
}

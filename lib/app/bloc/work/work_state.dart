part of 'work_bloc.dart';

abstract class WorkState extends Equatable {
  const WorkState();

  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkLoaded extends WorkState {
  final WorksWrapperResponse worksWrapperResponse;

  const WorkLoaded({required this.worksWrapperResponse});

  @override
  List<Object> get props => [];
}

class WorkException extends WorkState {
  final String message;

  const WorkException({required this.message});

  @override
  List<Object> get props => [message];
}

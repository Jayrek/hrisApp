part of 'leaves_bloc.dart';

abstract class LeavesState extends Equatable {
  const LeavesState();

  @override
  List<Object> get props => [];
}

class LeavesInitial extends LeavesState {}

class LeavesLoading extends LeavesState {}

class LeavesLoaded extends LeavesState {
  const LeavesLoaded({required this.leavesWrapperResponse});

  final LeavesWrapperResponse leavesWrapperResponse;

  @override
  List<Object> get props => [leavesWrapperResponse];
}

class LeavesException extends LeavesState {
  const LeavesException(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

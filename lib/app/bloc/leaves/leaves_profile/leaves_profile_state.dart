part of 'leaves_profile_bloc.dart';

abstract class LeavesProfileState extends Equatable {
  const LeavesProfileState();

  @override
  List<Object> get props => [];
}

class LeavesProfileInitial extends LeavesProfileState {}

class LeavesProfileLoading extends LeavesProfileState {}

class LeavesProfileLoaded extends LeavesProfileState {
  const LeavesProfileLoaded({required this.leavesWrapperResponse});

  final LeavesWrapperResponse leavesWrapperResponse;

  @override
  List<Object> get props => [leavesWrapperResponse];
}

class LeavesProfileException extends LeavesProfileState {
  const LeavesProfileException(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

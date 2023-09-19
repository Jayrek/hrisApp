part of 'change_request_bloc.dart';

abstract class ChangeRequestState extends Equatable {
  const ChangeRequestState();

  @override
  List<Object> get props => [];
}

class ChangeRequestInitial extends ChangeRequestState {}

class ChangeRequestLoading extends ChangeRequestState {}

class ChangeRequestLoaded extends ChangeRequestState {
  final ChangeRequestWrapperResponse changeRequestWrapperResponse;

  const ChangeRequestLoaded({required this.changeRequestWrapperResponse});

  @override
  List<Object> get props => [changeRequestWrapperResponse];
}

class ChangeRequestException extends ChangeRequestState {
  final String message;

  const ChangeRequestException({required this.message});

  @override
  List<Object> get props => [message];
}

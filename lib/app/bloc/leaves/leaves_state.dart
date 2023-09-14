part of 'leaves_bloc.dart';

class LeavesState extends Equatable {
  const LeavesState();

  @override
  List<Object?> get props => [];
  // const LeavesState({
  //   this.isLoading = false,
  //   this.exceptionMessage = '',
  //   this.leavesWrapperResponse =  LeavesWrapperResponse(leavesResponse: null),
  //   this.leavesRequestResponseWrapper,
  // });

  // final bool isLoading;
  // final String exceptionMessage;
  // final LeavesWrapperResponse? leavesWrapperResponse;
  // final LeavesRequestResponseWrapper leavesRequestResponseWrapper;
  //
  // @override
  // List<Object?> get props => [
  //       isLoading,
  //       exceptionMessage,
  //       leavesWrapperResponse,
  //       leavesRequestResponseWrapper,
  //     ];
  //
  // LeavesState copyWith({
  //   bool? isLoading,
  //   String? exceptionMessage,
  //   LeavesWrapperResponse? leavesWrapperResponse,
  //   LeavesRequestResponseWrapper? leavesRequestResponseWrapper,
  // }) {
  //   return LeavesState(
  //     isLoading: isLoading ?? this.isLoading,
  //     exceptionMessage: exceptionMessage ?? this.exceptionMessage,
  //     leavesWrapperResponse:
  //         leavesWrapperResponse ?? this.leavesWrapperResponse,
  //     leavesRequestResponseWrapper:
  //         leavesRequestResponseWrapper ?? this.leavesRequestResponseWrapper,
  //   );
  // }
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

class LeavesSetLoaded extends LeavesState {
  const LeavesSetLoaded({required this.leavesRequestResponseWrapper});

  final LeavesRequestResponseWrapper leavesRequestResponseWrapper;

  @override
  List<Object> get props => [leavesRequestResponseWrapper];
}

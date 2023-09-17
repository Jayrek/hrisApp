part of 'my_access_bloc.dart';

enum MyAccessStatus { initial, loading, success, failure }

final class MyAccessState extends Equatable {
  const MyAccessState({
    this.myAccessStatus = MyAccessStatus.initial,
    this.myAccessWrapperResponse,
    this.userName = '',
  });

  final MyAccessStatus myAccessStatus;
  final MyAccessWrapperResponse? myAccessWrapperResponse;
  final String userName;

  @override
  List<Object?> get props => [
        myAccessStatus,
        myAccessWrapperResponse,
        userName,
      ];

  MyAccessState copyWith({
    MyAccessStatus? myAccessStatus,
    MyAccessWrapperResponse? myAccessWrapperResponse,
  }) {
    return MyAccessState(
      myAccessStatus: myAccessStatus ?? this.myAccessStatus,
      myAccessWrapperResponse:
          myAccessWrapperResponse ?? this.myAccessWrapperResponse,
    );
  }
}

// class MyAccessInitial extends MyAccessState {}
//
// class MyAccessLoading extends MyAccessState {}
//
// class MyAccessLoaded extends MyAccessState {
//   final MyAccessWrapperResponse myAccessWrapperResponse;
//
//   const MyAccessLoaded({required this.myAccessWrapperResponse});
//
//   @override
//   List<Object> get props => [MyAccessLoaded];
// }
//
// class MyAccessException extends MyAccessState {
//   final String message;
//
//   const MyAccessException({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }

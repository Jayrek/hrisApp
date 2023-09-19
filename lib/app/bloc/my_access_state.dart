part of 'my_access_bloc.dart';

enum MyAccessStatus { initial, loading, success, failure }

final class MyAccessState extends Equatable {
  const MyAccessState({
    this.myAccessStatus = MyAccessStatus.initial,
    this.myAccessWrapperResponse,
    this.changePasswordWrapperResponse,
    this.userName = '',
  });

  final MyAccessStatus myAccessStatus;
  final MyAccessWrapperResponse? myAccessWrapperResponse;
  final String userName;
  final ChangePasswordWrapperResponse? changePasswordWrapperResponse;

  @override
  List<Object?> get props => [
        myAccessStatus,
        myAccessWrapperResponse,
        userName,
        changePasswordWrapperResponse,
      ];

  MyAccessState copyWith({
    MyAccessStatus? myAccessStatus,
    MyAccessWrapperResponse? myAccessWrapperResponse,
    String? userName,
    ChangePasswordWrapperResponse? changePasswordWrapperResponse,
  }) {
    return MyAccessState(
      myAccessStatus: myAccessStatus ?? this.myAccessStatus,
      myAccessWrapperResponse:
          myAccessWrapperResponse ?? this.myAccessWrapperResponse,
      userName: userName ?? this.userName,
      changePasswordWrapperResponse:
          changePasswordWrapperResponse ?? this.changePasswordWrapperResponse,
    );
  }
}

/*class MyAccessInitial extends MyAccessState {}

class MyAccessLoading extends MyAccessState {}

class MyAccessLoaded extends MyAccessState {
  final MyAccessWrapperResponse myAccessWrapperResponse;

  const MyAccessLoaded({required this.myAccessWrapperResponse});

  @override
  List<Object> get props => [MyAccessLoaded];
}

class MyAccessChangePasswordLoading extends MyAccessState {}

class MyAccessChangePasswordLoaded extends MyAccessState {
  final ChangePasswordWrapperResponse changePasswordWrapperResponse;

  const MyAccessChangePasswordLoaded({required this.changePasswordWrapperResponse});

  @override
  List<Object> get props => [changePasswordWrapperResponse];
}

class MyAccessException extends MyAccessState {
  final String message;

  const MyAccessException({required this.message});

  @override
  List<Object> get props => [message];
}*/

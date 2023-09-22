part of 'my_access_bloc.dart';

enum MyAccessStatus { initial, loading, success, failure }

final class MyAccessState extends Equatable {
  const MyAccessState({
    this.myAccessStatus = MyAccessStatus.initial,
    this.myAccessWrapperResponse,
    this.changePasswordWrapperResponse,
    this.userName = '',
    this.isPasswordSuccess = false,
  });

  final MyAccessStatus myAccessStatus;
  final MyAccessWrapperResponse? myAccessWrapperResponse;
  final WrapperDefaultResponse? changePasswordWrapperResponse;
  final String userName;
  final bool isPasswordSuccess;

  @override
  List<Object?> get props => [
        myAccessStatus,
        myAccessWrapperResponse,
        changePasswordWrapperResponse,
        userName,
        isPasswordSuccess,
      ];

  MyAccessState copyWith({
    MyAccessStatus? myAccessStatus,
    MyAccessWrapperResponse? myAccessWrapperResponse,
    String? userName,
    WrapperDefaultResponse? changePasswordWrapperResponse,
    bool? isPasswordSuccess,
  }) {
    return MyAccessState(
      myAccessStatus: myAccessStatus ?? this.myAccessStatus,
      myAccessWrapperResponse:
          myAccessWrapperResponse ?? this.myAccessWrapperResponse,
      userName: userName ?? this.userName,
      changePasswordWrapperResponse:
          changePasswordWrapperResponse ?? this.changePasswordWrapperResponse,
      isPasswordSuccess: isPasswordSuccess ?? this.isPasswordSuccess,
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

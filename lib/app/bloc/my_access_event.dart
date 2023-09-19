part of 'my_access_bloc.dart';

abstract class MyAccessEvent extends Equatable {
  const MyAccessEvent();

  @override
  List<Object?> get props => [];
}

class MyAccessFetched extends MyAccessEvent {}

class MyAccessChangePasswordSubmit extends MyAccessEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const MyAccessChangePasswordSubmit({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        currentPassword,
        newPassword,
        confirmPassword,
      ];
}

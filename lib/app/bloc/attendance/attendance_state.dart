part of 'attendance_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final AttendanceWrapperResponse attendanceWrapperResponse;

  const AttendanceLoaded({required this.attendanceWrapperResponse});

  @override
  List<Object> get props => [attendanceWrapperResponse];
}

class AttendanceException extends AttendanceState {
  final String message;

  const AttendanceException({required this.message});

  @override
  List<Object> get props => [message];
}

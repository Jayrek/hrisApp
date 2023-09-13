part of 'time_in_out_bloc.dart';

abstract class TimeInOutState extends Equatable {
  const TimeInOutState();

  @override
  List<Object> get props => [];
}

class TimeInOutInitial extends TimeInOutState {}

class TimeInOutLoading extends TimeInOutState {}

class TimeInOutLoaded extends TimeInOutState {
  final AttendanceInOutWrapperResponse attendanceInOutWrapperResponse;

  const TimeInOutLoaded({required this.attendanceInOutWrapperResponse});

  @override
  List<Object> get props => [attendanceInOutWrapperResponse];
}

class TimeInOutException extends TimeInOutState {
  final String message;

  const TimeInOutException({required this.message});

  @override
  List<Object> get props => [];
}

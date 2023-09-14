part of 'time_in_out_bloc.dart';

abstract class TimeInOutEvent extends Equatable {
  const TimeInOutEvent();

  @override
  List<Object?> get props => [];
}

class TimeInOutSet extends TimeInOutEvent {
  final String type;

  const TimeInOutSet({required this.type});

  @override
  List<Object?> get props => [type];
}

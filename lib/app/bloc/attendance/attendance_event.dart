part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();
}

class AttendanceFetched extends AttendanceEvent {
  final String dateFrom;
  final String dateTo;

  const AttendanceFetched({
    required this.dateFrom,
    required this.dateTo,
  });

  @override
  List<Object?> get props => [
        dateFrom,
        dateTo,
      ];
}

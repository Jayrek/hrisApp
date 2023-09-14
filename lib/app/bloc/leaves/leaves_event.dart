part of 'leaves_bloc.dart';

abstract class LeavesEvent extends Equatable {
  const LeavesEvent();

  @override
  List<Object?> get props => [];
}

class LeavesFetched extends LeavesEvent {
  const LeavesFetched({
    required this.dateFrom,
    required this.dateTo,
    required this.type,
    required this.status,
  });

  final String dateFrom;
  final String dateTo;
  final String type;
  final String status;

  @override
  List<Object?> get props => [
        dateFrom,
        dateTo,
        type,
        status,
      ];
}

class LeavesApplicationSet extends LeavesEvent {
  const LeavesApplicationSet({
    required this.dateFrom,
    required this.dateTo,
    required this.type,
    required this.description,
  });

  final String dateFrom;
  final String dateTo;
  final String type;
  final String description;

  @override
  List<Object?> get props => [
        dateFrom,
        dateTo,
        type,
        description,
      ];
}

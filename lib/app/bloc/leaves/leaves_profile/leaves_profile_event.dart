part of 'leaves_profile_bloc.dart';

abstract class LeavesProfileEvent extends Equatable {
  const LeavesProfileEvent();

  @override
  List<Object?> get props => [];
}

class LeavesProfileFetched extends LeavesProfileEvent {
  const LeavesProfileFetched({
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

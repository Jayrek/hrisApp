part of 'change_request_bloc.dart';

abstract class ChangeRequestEvent extends Equatable {
  const ChangeRequestEvent();

  @override
  List<Object?> get props => [];
}

class ChangeRequestFetched extends ChangeRequestEvent {
  final String status;

  const ChangeRequestFetched({required this.status});

  @override
  List<Object?> get props => [status];
}

class ChangeRequestSet extends ChangeRequestEvent {
  final String category;
  final String oldData;
  final String newData;

  const ChangeRequestSet({
    required this.category,
    required this.oldData,
    required this.newData,
  });

  @override
  List<Object?> get props => [
        category,
        oldData,
        newData,
      ];
}

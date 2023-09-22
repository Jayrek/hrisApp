part of 'performance_bloc.dart';

abstract class PerformanceEvent extends Equatable {
  const PerformanceEvent();

  @override
  List<Object?> get props => [];
}

class PerformanceProfileFetched extends PerformanceEvent {}

class PerformanceGoalsFetched extends PerformanceEvent {}

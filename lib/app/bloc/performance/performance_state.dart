part of 'performance_bloc.dart';

abstract class PerformanceState extends Equatable {
  const PerformanceState();

  @override
  List<Object> get props => [];
}

class PerformanceInitial extends PerformanceState {}

class PerformanceLoading extends PerformanceState {}

class PerformanceProfileLoaded extends PerformanceState {
  final PerformanceWrapperResponse performanceWrapperResponse;

  const PerformanceProfileLoaded({required this.performanceWrapperResponse});

  @override
  List<Object> get props => [performanceWrapperResponse];
}

class PerformanceGoalsLoaded extends PerformanceState {
  final GoalsWrapperResponse goalsWrapperResponse;

  const PerformanceGoalsLoaded({required this.goalsWrapperResponse});

  @override
  List<Object> get props => [goalsWrapperResponse];
}

class PerformanceException extends PerformanceState {
  final String message;

  const PerformanceException({required this.message});

  @override
  List<Object> get props => [message];
}

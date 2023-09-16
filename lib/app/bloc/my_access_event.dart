part of 'my_access_bloc.dart';

abstract class MyAccessEvent extends Equatable {
  const MyAccessEvent();

  @override
  List<Object?> get props => [];
}

class MyAccessFetched extends MyAccessEvent {}

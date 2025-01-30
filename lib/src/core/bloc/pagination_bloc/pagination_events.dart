import 'package:equatable/equatable.dart';

sealed class PaginationEvent extends Equatable {}

class PaginationLoadItemAtIndexEvent extends PaginationEvent {
  PaginationLoadItemAtIndexEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class PaginationFetchDataEvent<T extends Object> extends PaginationEvent {
  PaginationFetchDataEvent({
    this.data = const [],
    this.count = 0,
  });

  final int count;
  final List<T> data;

  @override
  List<Object?> get props => [];
}

class PaginationInitialFetchEvent extends PaginationEvent {
  @override
  List<Object?> get props => [];
}

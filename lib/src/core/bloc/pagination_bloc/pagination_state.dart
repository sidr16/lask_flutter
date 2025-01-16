import 'package:equatable/equatable.dart';

sealed class PaginationState<T extends Object> extends Equatable {}

class PaginationLoadingState<T extends Object> extends PaginationState<T> {
  @override
  List<Object?> get props => [];
}

class PaginationLoadedDataState<T extends Object> extends PaginationState<T> {
  PaginationLoadedDataState({required this.count, required this.data});

  final int count;
  final List<T> data;

  @override
  List<Object?> get props => [count, data];
}

class PaginationLoadingWithDataState<T extends Object>
    extends PaginationState<T> {
  PaginationLoadingWithDataState({required this.data, required this.count});

  final List<T> data;
  final int count;

  @override
  List<Object?> get props => [data, count];
}

class PaginationErrorState<T extends Object> extends PaginationState<T> {
  PaginationErrorState({required this.error});

  final Object error;

  @override
  List<Object?> get props => [error];
}

class PaginationErrorWithLoadedDataState<T extends Object>
    extends PaginationState<T> {
  PaginationErrorWithLoadedDataState({
    required this.error,
    required this.count,
    required this.data,
  });

  final dynamic error;
  final List<T> data;
  final int count;

  @override
  List<Object?> get props => [error, data, count];
}

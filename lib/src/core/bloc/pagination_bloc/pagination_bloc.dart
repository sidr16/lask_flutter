import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/result_model/result_model.dart';
import '../../utils/exception/exception_handler.dart';
import 'pagination_events.dart';
import 'pagination_state.dart';

typedef PaginationFetchDataAction<T extends Object, N extends Object?>
    = Future<Either<AppException, ResultModel<T>>> Function(
  int page,
  int pageSize,
  N? args,
);

class PaginationBloc<T extends Object, N extends Object?>
    extends Bloc<PaginationEvent, PaginationState<T>> {
  PaginationBloc({
    required this.onFetchData,
    this.pageSize = 10,
  }) : super(PaginationLoadingState<T>()) {
    on<PaginationLoadItemAtIndexEvent>(_onLoadItemAtIndex);
    on<PaginationInitialFetchEvent>(_onInitialFetch);
    on<PaginationFetchDataEvent<T>>(_onFetchData);
  }

  N? _args;
  int _page = 0;

  N? get args => _args;
  int get page => _page;

  final int pageSize;
  final PaginationFetchDataAction<T, N?> onFetchData;

  void initialize([N? args]) {
    _args = args;
    add(PaginationInitialFetchEvent());
  }

  void onLoadItemAtIndex(int index) {
    add(PaginationLoadItemAtIndexEvent(index: index));
  }

  void onRefresh() {
    add(PaginationInitialFetchEvent());
  }

  Future<void> _onLoadItemAtIndex(
    PaginationLoadItemAtIndexEvent event,
    Emitter<PaginationState> emit,
  ) async {
    final temp = state;

    if (temp is PaginationLoadedDataState<T>) {
      final dataLength = temp.data.length;

      if (event.index < 0 || temp.count <= temp.data.length) {
        return;
      }

      if (dataLength - 1 <= event.index) {
        add(
          PaginationFetchDataEvent<T>(
            data: temp.data,
            count: temp.count,
          ),
        );
      }
    }
  }

  Future<void> _onInitialFetch(
    PaginationInitialFetchEvent event,
    Emitter<PaginationState> emit,
  ) async {
    _page = 0;
    add(PaginationFetchDataEvent<T>());
  }

  Future<void> _onFetchData(
    PaginationFetchDataEvent<T> event,
    Emitter<PaginationState> emit,
  ) async {
    final dataIsEmpty = event.data.isEmpty || _page == 0;

    if (dataIsEmpty) {
      emit(PaginationLoadingState<T>());
    } else {
      emit(
        PaginationLoadingWithDataState<T>(
          data: event.data,
          count: event.count,
        ),
      );
    }

    final result = await onFetchData(
      _page,
      pageSize,
      _args,
    );

    result.fold((error) {
      if (dataIsEmpty) {
        emit(
          PaginationErrorState<T>(
            error: error,
          ),
        );
      } else {
        emit(
          PaginationErrorWithLoadedDataState<T>(
            error: error,
            count: event.count,
            data: event.data,
          ),
        );
      }
    }, (data) {
      _page++;

      emit(
        PaginationLoadedDataState<T>(
          count: data.count,
          data: [...event.data, ...data.data],
        ),
      );
    });
  }
}

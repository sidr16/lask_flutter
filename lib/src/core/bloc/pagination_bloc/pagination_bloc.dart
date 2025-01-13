import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/result_model/result_model.dart';
import 'pagination_events.dart';
import 'pagination_state.dart';

typedef PaginationFetchDataAction<T extends Object> = Future<ResultModel<T>>
    Function(
  int page,
  int pageSize,
);

class PaginationBloc<T extends Object>
    extends Bloc<PaginationEvent, PaginationState<T>> {
  PaginationBloc({
    required this.onFetchData,
    this.pageSize = 10,
  }) : super(PaginationLoadingState<T>()) {
    on<PaginationLoadItemAtIndexEvent>(_onLoadItemAtIndex);
    on<PaginationInitialFetchEvent>(_onInitialFetch);
    on<PaginationFetchDataEvent<T>>(_onFetchData);
  }

  int page = 0;
  final int pageSize;
  final PaginationFetchDataAction<T> onFetchData;

  void initialize() {
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
    page = 0;
    add(PaginationFetchDataEvent<T>());
  }

  Future<void> _onFetchData(
    PaginationFetchDataEvent<T> event,
    Emitter<PaginationState> emit,
  ) async {
    final dataIsEmpty = event.data.isEmpty || page == 0;

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

    try {
      final result = await onFetchData(page, pageSize);

      page++;

      emit(
        PaginationLoadedDataState<T>(
          count: result.count,
          data: [...event.data, ...result.data],
        ),
      );
    } on Exception catch (err) {
      if (dataIsEmpty) {
        emit(
          PaginationErrorState<T>(
            error: err,
          ),
        );
      } else {
        emit(
          PaginationErrorWithLoadedDataState<T>(
            error: err,
            count: event.count,
            data: event.data,
          ),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';

import 'pagination_state.dart';

extension PaginationStateExtension<T extends Object> on PaginationState<T> {
  Widget when({
    required Widget Function() loading,
    required Widget Function(List<T> data) data,
    required Widget Function(Object error) error,
    required Widget Function(List<T> data) loadingWithData,
    required Widget Function(List<T> data, dynamic error) errorWithData,
  }) {
    return AnimatedSwitcher(
      duration: Durations.medium3,
      child: switch (this) {
        final PaginationLoadedDataState<T> state => data(state.data),
        final PaginationLoadingWithDataState<T> state => loadingWithData(
            state.data,
          ),
        final PaginationErrorState state => error(state.error),
        final PaginationLoadingState _ => loading(),
        final PaginationErrorWithLoadedDataState<T> state => errorWithData(
            state.data,
            state.error,
          ),
      },
    );
  }
}

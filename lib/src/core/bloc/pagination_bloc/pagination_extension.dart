import 'package:flutter/material.dart';

import 'pagination_state.dart';

extension PaginationStateExtension<T extends Object> on PaginationState<T> {
  Widget when({
    required Widget Function(List<T> data, bool isLoading) data,
    required Widget Function() loading,
    required Widget Function(Object error) error,
  }) {
    return AnimatedSwitcher(
      duration: Durations.medium3,
      child: switch (this) {
        final PaginationLoadedDataState<T> state => data(state.data, false),
        final PaginationLoadingWithDataState<T> state => data(
            state.data,
            true,
          ),
        final PaginationErrorState state => error(state.error),
        final PaginationLoadingState _ => loading(),
        final PaginationErrorWithLoadedDataState<T> state => data(
            state.data,
            false,
          ),
      },
    );
  }
}

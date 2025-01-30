import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/exception/exception_handler.dart';
import '../../../domain/repositories/news_repository.dart';
import 'categories_events.dart';
import 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this.repository) : super(CategoryLoadingState()) {
    on<CategoriesFetchDataEvent>(_onFetchData);
  }

  final NewsRepository repository;

  void fetch() {
    add(CategoriesFetchDataEvent());
  }

  Future<void> _onFetchData(
    CategoriesFetchDataEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoryLoadingState());

    try {
      final data = await repository.fetchCategories();

      emit(CategoryDataState(data));
    } on AppException catch (error) {
      emit(CategoryErrorState(error));
    }
  }
}

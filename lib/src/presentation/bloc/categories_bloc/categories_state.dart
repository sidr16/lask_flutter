import 'package:equatable/equatable.dart';

import '../../../domain/models/category_model/category_model.dart';

sealed class CategoriesState extends Equatable {}

class CategoryLoadingState extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoryDataState extends CategoriesState {
  CategoryDataState(this.categories);

  final List<CategoryModel> categories;

  @override
  List<Object?> get props => [categories];
}

class CategoryErrorState extends CategoriesState {
  CategoryErrorState(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}

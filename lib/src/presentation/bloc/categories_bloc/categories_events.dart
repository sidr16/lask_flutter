import 'package:equatable/equatable.dart';

sealed class CategoriesEvent extends Equatable {}

class CategoriesFetchDataEvent extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}

import 'package:flutter/material.dart';

import '../../../config/constants/constants.dart';
import '../../../domain/models/category_model/category_model.dart';
import '../buttons/primary_selectable_button.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    this.categories = const [],
    this.selected,
    this.onSelect,
    super.key,
  });

  final CategoryModel? selected;
  final List<CategoryModel> categories;
  final void Function(CategoryModel category)? onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.xLarge,
          vertical: Spaces.small,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selected == category;

          return PrimarySelectableButton(
            title: category.name,
            onPressed: () {
              onSelect?.call(category);
            },
            isSelected: isSelected,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.xSmall;
        },
        itemCount: categories.length,
      ),
    );
  }
}

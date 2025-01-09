import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../buttons/primary_selectable_button.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Paddings.xLarge,
          vertical: Paddings.small,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PrimarySelectableButton(
            title: 'Category ${index + 1}',
            onPressed: () {},
            isSelected: index == 0,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.xSmall;
        },
        itemCount: 10,
      ),
    );
  }
}

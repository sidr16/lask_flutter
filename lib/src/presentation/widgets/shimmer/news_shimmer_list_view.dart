import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../cards/news_card.dart';
import 'news_shimmer_card.dart';
import 'primary_shimmer.dart';

class NewsShimmerListView extends StatelessWidget {
  const NewsShimmerListView({
    this.padding = const EdgeInsets.symmetric(
      vertical: Spaces.xSmall,
      horizontal: Spaces.xLarge,
    ),
    this.scrollDirection = Axis.vertical,
    this.cardType = NewsCardType.small,
    this.isFirstLarge = false,
    this.isSliver = false,
    this.height = 385,
    this.itemCount = 10,
    super.key,
  });

  factory NewsShimmerListView.horizontal({
    NewsCardType cardType = NewsCardType.primary,
  }) =>
      NewsShimmerListView(
        cardType: cardType,
        scrollDirection: Axis.horizontal,
      );

  final double height;
  final int itemCount;
  final bool isSliver;
  final bool isFirstLarge;
  final Axis scrollDirection;
  final NewsCardType cardType;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverPadding(
        padding: padding ?? EdgeInsets.zero,
        sliver: SliverList.separated(
          itemBuilder: (context, index) {
            if (itemCount == index) {
              return const SafeArea(
                child: SizedBox.shrink(),
              );
            }

            return PrimaryShimmer(
              child: NewsShimmerCard(
                type:
                    isFirstLarge && index == 0 ? NewsCardType.large : cardType,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gaps.medium;
          },
          itemCount: itemCount + 1,
        ),
      );
    }

    return PrimaryShimmer(
      child: SizedBox(
        height: scrollDirection == Axis.horizontal ? height : null,
        child: ListView.separated(
          scrollDirection: scrollDirection,
          padding: padding,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (itemCount == index) {
              return const SafeArea(
                child: SizedBox.shrink(),
              );
            }

            final isFirst = index == 0;

            return NewsShimmerCard(
              type: isFirstLarge && isFirst ? NewsCardType.large : cardType,
            );
          },
          separatorBuilder: (context, index) {
            return Gaps.medium;
          },
          itemCount: itemCount + 1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/constants.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../cards/news_card.dart';
import '../shimmer/news_shimmer_card.dart';
import '../shimmer/primary_shimmer.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.news,
    this.onItemBuildIndex,
    this.padding = const EdgeInsets.symmetric(
      vertical: Spaces.xSmall,
      horizontal: Spaces.xLarge,
    ),
    this.scrollDirection = Axis.vertical,
    this.cardType = NewsCardType.small,
    this.isFirstLarge = false,
    this.showShimmer = false,
    this.isSliver = false,
    this.height = 385,
    super.key,
  });

  factory NewsListView.horizontal({
    required List<NewsModel> news,
    NewsCardType cardType = NewsCardType.primary,
    void Function(int index)? onItemBuildIndex,
    bool showShimmer = false,
  }) =>
      NewsListView(
        news: news,
        cardType: cardType,
        showShimmer: showShimmer,
        scrollDirection: Axis.horizontal,
        onItemBuildIndex: onItemBuildIndex,
      );

  final double height;
  final bool isSliver;
  final bool showShimmer;
  final bool isFirstLarge;
  final Axis scrollDirection;
  final List<NewsModel> news;
  final NewsCardType cardType;
  final EdgeInsetsGeometry? padding;
  final void Function(int index)? onItemBuildIndex;

  @override
  Widget build(BuildContext context) {
    var itemCount = news.length + 1;

    if (showShimmer) {
      itemCount += 10;
    }

    if (isSliver) {
      return SliverPadding(
        padding: padding ?? EdgeInsets.zero,
        sliver: SliverList.separated(
          itemBuilder: (context, index) {
            return _buildItem(index, itemCount);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gaps.medium;
          },
          itemCount: itemCount,
        ),
      );
    }

    return SizedBox(
      height: scrollDirection == Axis.horizontal ? height : null,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        padding: padding,
        itemBuilder: (context, index) {
          return _buildItem(index, itemCount);
        },
        separatorBuilder: (context, index) {
          return Gaps.medium;
        },
        itemCount: itemCount,
      ),
    );
  }

  Widget _buildItem(int index, int itemCount) {
    final isFirst = index == 0;

    final newsCardType =
        isFirstLarge && isFirst ? NewsCardType.large : cardType;

    if (news.length <= index && showShimmer) {
      return PrimaryShimmer(
        child: NewsShimmerCard(
          type: newsCardType,
        ),
      );
    }

    if (itemCount - 1 == index) {
      return const SafeArea(
        child: SizedBox.shrink(),
      );
    }

    final item = news[index];

    onItemBuildIndex?.call(index);

    return NewsCard(
      title: item.title,
      imageUrl: item.imageUrl,
      subtitle: item.category?.name,
      type: newsCardType,
    ).animate().fade();
  }
}

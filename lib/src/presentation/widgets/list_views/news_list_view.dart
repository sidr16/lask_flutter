import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../cards/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.news,
    this.padding = const EdgeInsets.symmetric(
      vertical: Paddings.xSmall,
      horizontal: Paddings.xLarge,
    ),
    this.scrollDirection = Axis.vertical,
    this.cardType = NewsCardType.small,
    this.isFirstLarge = false,
    this.isSliver = false,
    this.height = 385,
    super.key,
  });

  factory NewsListView.horizontal({
    required List<NewsModel> news,
    NewsCardType cardType = NewsCardType.primary,
  }) =>
      NewsListView(
        scrollDirection: Axis.horizontal,
        cardType: cardType,
        news: news,
      );

  final double height;
  final bool isSliver;
  final bool isFirstLarge;
  final Axis scrollDirection;
  final List<NewsModel> news;
  final NewsCardType cardType;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverPadding(
        padding: padding ?? EdgeInsets.zero,
        sliver: SliverList.separated(
          itemBuilder: (context, index) {
            return NewsCard(
              type: isFirstLarge && index == 0 ? NewsCardType.large : cardType,
              title: news[index].title,
              imageUrl: news[index].imageUrl,
              subtitle: news[index].category?.name,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gaps.medium;
          },
          itemCount: news.length,
        ),
      );
    }

    return SizedBox(
      height: scrollDirection == Axis.horizontal ? height : null,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        padding: padding,
        itemBuilder: (context, index) {
          return NewsCard(
            type: isFirstLarge && index == 0 ? NewsCardType.large : cardType,
            title: news[index].title,
            imageUrl: news[index].imageUrl,
            subtitle: news[index].category?.name,
          );
        },
        separatorBuilder: (context, index) {
          return Gaps.medium;
        },
        itemCount: news.length,
      ),
    );
  }
}

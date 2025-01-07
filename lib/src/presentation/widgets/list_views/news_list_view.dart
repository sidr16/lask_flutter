import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../cards/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.news,
    this.scrollDirection = Axis.horizontal,
    this.newsCardType = NewsCardType.primary,
    this.height = 385,
    super.key,
  });

  final double height;
  final Axis scrollDirection;
  final NewsCardType newsCardType;
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scrollDirection == Axis.horizontal ? height : null,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        padding: const EdgeInsets.symmetric(
          vertical: Paddings.small,
          horizontal: Paddings.xLarge,
        ),
        itemBuilder: (context, index) {
          final item = news[index];

          return NewsCard(
            type: newsCardType,
            title: item.title,
            imageUrl: item.imageUrl,
            subtitle: item.category?.name,
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

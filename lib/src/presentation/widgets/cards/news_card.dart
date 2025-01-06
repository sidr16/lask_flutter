import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../core/config/theme/app_theme.dart';
import '../shimmer/primary_shimmer.dart';

enum NewsCardType {
  large,
  small,
  medium,
}

class NewsCard extends StatefulWidget {
  const NewsCard({
    required this.title,
    this.type = NewsCardType.medium,
    this.subtitle,
    super.key,
  });

  factory NewsCard.large({
    required String title,
    Key? key,
  }) {
    return NewsCard(
      key: key,
      type: NewsCardType.large,
      title: title,
    );
  }

  factory NewsCard.small({
    required String title,
    Key? key,
  }) {
    return NewsCard(
      key: key,
      type: NewsCardType.small,
      title: title,
    );
  }

  final String title;
  final String? subtitle;
  final NewsCardType type;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      NewsCardType.large => _buildLarge(),
      NewsCardType.medium => _buildMedium(),
      NewsCardType.small => _buildSmall(),
    };
  }

  Widget _buildLarge() {
    return SizedBox(
      width: 270,
      child: Column(
        children: [
          Expanded(
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildMedium() {
    return SizedBox(
      width: 270,
      child: Column(
        children: [
          Expanded(
            child: _buildImage(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Paddings.small,
              vertical: Paddings.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.textStyles.heading4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.subtitle != null) ...[
                  Gaps.small,
                  Text(
                    widget.subtitle!,
                    style: context.textStyles.body2Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmall() {
    return SizedBox(
      width: 270,
      child: Column(
        children: [
          Expanded(
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return IntrinsicHeight(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          BorderRadiuses.small,
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          imageUrl: 'https://picsum.photos/200/300#${widget.key}',
          placeholder: (context, url) => const PrimaryShimmer(),
        ),
      ),
    );
  }
}

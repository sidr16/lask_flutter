import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../core/config/theme/app_theme.dart';
import '../shimmer/primary_shimmer.dart';

enum NewsCardType {
  large,
  small,
  primary,
}

class NewsCard extends StatefulWidget {
  const NewsCard({
    required this.title,
    required this.imageUrl,
    this.type = NewsCardType.primary,
    this.subtitle,
    super.key,
  });

  factory NewsCard.large({
    required String title,
    required String imageUrl,
    Key? key,
  }) {
    return NewsCard(
      key: key,
      title: title,
      imageUrl: imageUrl,
      type: NewsCardType.large,
    );
  }

  factory NewsCard.small({
    required String title,
    required String imageUrl,
    Key? key,
  }) {
    return NewsCard(
      key: key,
      title: title,
      imageUrl: imageUrl,
      type: NewsCardType.small,
    );
  }

  final String title;
  final String? subtitle;
  final NewsCardType type;
  final String imageUrl;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      NewsCardType.large => _buildLarge(),
      NewsCardType.primary => _buildPrimary(),
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

  Widget _buildPrimary() {
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
          imageUrl: widget.imageUrl,
          placeholder: (context, url) => const PrimaryShimmer(),
        ),
      ),
    );
  }
}

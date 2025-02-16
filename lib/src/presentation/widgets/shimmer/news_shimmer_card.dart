import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/constants/constants.dart';
import '../cards/news_card.dart';
import 'shimmer_container.dart';

class NewsShimmerCard extends StatefulWidget {
  const NewsShimmerCard({required this.type, super.key});

  final NewsCardType type;

  @override
  State<NewsShimmerCard> createState() => _NewsShimmerCardState();
}

class _NewsShimmerCardState extends State<NewsShimmerCard> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: _buildImage(),
          ),
          Gaps.medium,
          const ShimmerContainer(
            width: 200,
            height: 30,
          ),
          Gaps.small,
          _buildAuthorDetails(),
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Spaces.xSmall,
              vertical: Spaces.medium,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    width: 140,
                    height: 30,
                  ),
                  Gaps.small,
                  ShimmerContainer(
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmall() {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerContainer(
                  width: 200,
                  height: 30,
                ),
                const Gap(4),
                _buildAuthorDetails(),
              ],
            ),
          ),
          Gaps.medium,
          SizedBox(
            width: 110,
            height: 80,
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorDetails() {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: context.colors.brandBlue10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: context.colors.grey1,
            ),
          ),
        ),
        Gaps.small,
        const ShimmerContainer(
          width: 100,
          height: 15,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return const IntrinsicHeight(
      child: ShimmerContainer(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

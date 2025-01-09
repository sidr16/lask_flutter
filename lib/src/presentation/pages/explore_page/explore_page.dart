import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/config/constants/constants.dart';
import '../../../core/config/theme/app_theme.dart';
import '../../../data/mock/news_mock_data.dart';
import '../../widgets/app_bar/secondary_app_bar.dart';
import '../../widgets/list_views/category_list_view.dart';
import '../../widgets/list_views/news_list_view.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        title: 'Explore',
        customPreferredSize: const Size.fromHeight(68),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Gaps.large,
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverGap(8),
          SliverAppBar(
            pinned: true,
            surfaceTintColor: Colors.transparent,
            leadingWidth: double.infinity,
            backgroundColor: context.colors.backgroundPrimary,
            leading: const CategoryListView(),
          ),
          NewsListView(
            isFirstLarge: true,
            isSliver: true,
            news: NewsMockData.getNews(),
          ),
          const SliverSafeArea(sliver: SliverToBoxAdapter()),
        ],
      ),
    );
  }
}

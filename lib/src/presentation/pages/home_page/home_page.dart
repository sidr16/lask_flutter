import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../data/mock/news_mock_data.dart';
import '../../widgets/list_views/news_list_view.dart';
import 'widgets/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Paddings.xSmall,
        ),
        child: Column(
          children: [
            NewsListView.horizontal(
              news: NewsMockData.getNews(),
            ),
            Gaps.medium,
            const SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

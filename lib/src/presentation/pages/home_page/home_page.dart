import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../../domain/models/category_model/category_model.dart';
import '../../../domain/models/news_model/news_model.dart';
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
          vertical: Paddings.small,
        ),
        child: Column(
          children: [
            NewsListView(
              news: [
                NewsModel(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  imageUrl: 'https://picsum.photos/200/300',
                  publishedAt: DateTime.now(),
                  category: CategoryModel(name: 'Technology'),
                ),
                NewsModel(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  imageUrl: 'https://picsum.photos/200/301',
                  publishedAt: DateTime.now(),
                  category: CategoryModel(name: 'Technology'),
                ),
                NewsModel(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  imageUrl: 'https://picsum.photos/200/302',
                  publishedAt: DateTime.now(),
                  category: CategoryModel(name: 'Technology'),
                ),
              ],
            ),
            Gaps.medium,
            const SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

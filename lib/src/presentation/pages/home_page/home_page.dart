import 'package:flutter/material.dart';

import '../../../core/config/constants/constants.dart';
import '../../widgets/cards/news_card.dart';
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
            SizedBox(
              height: 385,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  vertical: Paddings.small,
                  horizontal: Paddings.xLarge,
                ),
                itemBuilder: (context, index) {
                  return NewsCard(
                    key: ValueKey(index),
                    subtitle: 'Technology',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  );
                },
                separatorBuilder: (context, index) {
                  return Gaps.medium;
                },
                itemCount: 3,
              ),
            ),
            Gaps.medium,
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  vertical: Paddings.small,
                  horizontal: Paddings.xLarge,
                ),
                itemBuilder: (context, index) {
                  return NewsCard.large(
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    key: ValueKey((index + 1) * 2),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gaps.medium;
                },
                itemCount: 3,
              ),
            ),
            Gaps.medium,
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  vertical: Paddings.small,
                  horizontal: Paddings.xLarge,
                ),
                itemBuilder: (context, index) {
                  return NewsCard.small(
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    key: ValueKey((index + 1) * 3),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gaps.medium;
                },
                itemCount: 3,
              ),
            ),
            const SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

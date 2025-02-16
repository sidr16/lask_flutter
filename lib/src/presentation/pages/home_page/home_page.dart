import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/sections/news_section.dart';
import 'widgets/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomePageAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: Spaces.xSmall,
        ),
        child: Column(
          spacing: Spaces.medium,
          children: [
            NewsSection(),
            NewsSection(
              title: 'News of the week',
            ),
            NewsSection(
              title: 'Most liked news',
            ),
            NewsSection(
              title: 'Just for you',
            ),
            SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

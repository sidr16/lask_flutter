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
          children: [
            NewsSection(),
            Gaps.medium,
            SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

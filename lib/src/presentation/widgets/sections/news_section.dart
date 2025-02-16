import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../core/constants/constants.dart';
import '../../../core/di/injectable.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../headers/section_head.dart';
import '../list_views/news_list_view.dart';
import '../shimmer/news_shimmer_list_view.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final newsBloc = getIt<NewsBloc>();

    return Column(
      spacing: Spaces.medium,
      children: [
        if (title != null)
          SectionHead(
            title: title!,
          ),
        BlocProvider(
          create: (context) => newsBloc..initialize(),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return state.when(
                data: (data, isLoading) {
                  return NewsListView.horizontal(
                    news: data,
                    onItemBuildIndex: newsBloc.onLoadItemAtIndex,
                  );
                },
                loading: NewsShimmerListView.horizontal,
                error: ErrorWidget.new,
              );
            },
          ),
        ),
      ],
    );
  }
}

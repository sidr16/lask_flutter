import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../core/constants/constants.dart';
import '../../../core/di/injectable.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../headers/section_head.dart';
import '../list_views/news_list_view.dart';
import '../shimmer/news_shimmer_list_view.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key, this.title});

  final String? title;

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final _newsBloc = getIt<NewsBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Spaces.medium,
      children: [
        if (widget.title != null)
          SectionHead(
            title: widget.title!,
          ),
        BlocProvider(
          create: (context) => _newsBloc..initialize(),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return state.when(
                data: (data) {
                  return NewsListView.horizontal(
                    news: data,
                    onItemBuildIndex: _newsBloc.onLoadItemAtIndex,
                  );
                },
                loading: NewsShimmerListView.horizontal,
                error: ErrorWidget.new,
                loadingWithData: (data) {
                  return NewsListView.horizontal(
                    news: data,
                    onItemBuildIndex: _newsBloc.onLoadItemAtIndex,
                  );
                },
                errorWithData: (data, error) {
                  return NewsListView.horizontal(
                    news: data,
                    onItemBuildIndex: _newsBloc.onLoadItemAtIndex,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

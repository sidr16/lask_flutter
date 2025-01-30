import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../core/bloc/pagination_bloc/pagination_state.dart';
import '../../../core/constants/constants.dart';
import '../../../core/di/injectable.dart';
import '../../../domain/models/category_model/category_model.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../bloc/categories_bloc/categories_bloc.dart';
import '../../bloc/categories_bloc/categories_state.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../../widgets/app_bar/secondary_app_bar.dart';
import '../../widgets/list_views/category_list_view.dart';
import '../../widgets/list_views/news_list_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _scrollController = ScrollController();

  final _isScrolledDown = ValueNotifier<bool>(false);

  int _pageIndex = 0;

  final _pageController = PageController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _pageController.addListener(_pageListener);
    super.initState();
  }

  void _pageListener() {
    final page = _pageController.page?.floor();

    if (page == null) return;

    if (_pageIndex != page) {
      _pageIndex = page;
      setState(() {});
    }
  }

  void _scrollListener() {
    final isScrolledDown = _scrollController.position.pixels > 50;
    if (_isScrolledDown.value != isScrolledDown) {
      _isScrolledDown.value = isScrolledDown;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _pageController.removeListener(_pageListener);

    _isScrolledDown.dispose();
    _scrollController.dispose();
    super.dispose();
  }

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
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return switch (state) {
            final CategoryDataState state => Column(
                children: [
                  Gaps.small,
                  CategoryListView(
                    selected: state.categories[_pageIndex],
                    onSelect: (category) {
                      _pageController.jumpToPage(
                        state.categories.indexOf(category),
                      );
                      setState(() {});
                    },
                    categories: state.categories,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];

                        return _BuildNewsList(category);
                      },
                    ),
                  ),
                ],
              ),
            final CategoryErrorState state => ErrorWidget(state.error),
            final CategoryLoadingState _ => const Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }
}

class _BuildNewsList extends StatefulWidget {
  const _BuildNewsList(this.category);

  final CategoryModel? category;

  @override
  State<_BuildNewsList> createState() => _BuildNewsListState();
}

class _BuildNewsListState extends State<_BuildNewsList>
    with AutomaticKeepAliveClientMixin {
  late final newsBloc = getIt<NewsBloc>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => newsBloc..initialize(widget.category),
      child: BlocBuilder<NewsBloc, PaginationState<NewsModel>>(
        builder: (context, state) {
          return state.when(
            data: (data, isLoading) {
              return NewsListView(
                news: data,
                isFirstLarge: true,
                onItemBuildIndex: newsBloc.onLoadItemAtIndex,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: ErrorWidget.new,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../core/bloc/pagination_bloc/pagination_state.dart';
import '../../../core/config/constants/constants.dart';
import '../../../core/locators/service_locator.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../../widgets/app_bar/secondary_app_bar.dart';
import '../../widgets/list_views/category_list_view.dart';
import '../../widgets/list_views/news_list_view.dart';
import '../../widgets/wrappers/blur_wrapper.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _scrollController = ScrollController();

  final _isScrolledDown = ValueNotifier<bool>(false);

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    final isScrolledDown = _scrollController.position.pixels > 50;
    if (_isScrolledDown.value != isScrolledDown) {
      _isScrolledDown.value = isScrolledDown;
    }
  }

  @override
  void dispose() {
    _isScrolledDown.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (BuildContext context) => getIt.get<NewsBloc>(),
      child: Scaffold(
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
        body: RefreshIndicator(
          onRefresh: () async {
            getIt<NewsBloc>().onRefresh();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverGap(8),
              SliverAppBar(
                pinned: true,
                surfaceTintColor: Colors.transparent,
                leadingWidth: double.infinity,
                backgroundColor: Colors.transparent,
                leading: ValueListenableBuilder(
                  valueListenable: _isScrolledDown,
                  builder: (context, value, child) {
                    return BlurWrapper(
                      enabled: value,
                      child: child ?? const SizedBox(),
                    );
                  },
                  child: const CategoryListView(),
                ),
              ),
              BlocBuilder<NewsBloc, PaginationState<NewsModel>>(
                builder:
                    (BuildContext context, PaginationState<NewsModel> state) {
                  return state.when(
                    data: (data, isLoading) {
                      return NewsListView(
                        isFirstLarge: true,
                        isSliver: true,
                        news: data,
                        onItemBuildIndex: (index) {
                          getIt<NewsBloc>().onLoadItemAtIndex(index);
                        },
                      );
                    },
                    loading: () => const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (error) => SliverToBoxAdapter(
                      child: ErrorWidget(error as Object),
                    ),
                  );
                },
              ),
              const SliverSafeArea(sliver: SliverToBoxAdapter()),
            ],
          ),
        ),
      ),
    );
  }
}

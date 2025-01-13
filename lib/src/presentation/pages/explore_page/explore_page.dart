import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../core/bloc/pagination_bloc/pagination_state.dart';
import '../../../core/config/constants/constants.dart';
import '../../../core/config/theme/app_theme.dart';
import '../../../core/locators/service_locator.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../../widgets/app_bar/secondary_app_bar.dart';
import '../../widgets/list_views/category_list_view.dart';
import '../../widgets/list_views/news_list_view.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
            slivers: [
              const SliverGap(8),
              SliverAppBar(
                pinned: true,
                surfaceTintColor: Colors.transparent,
                leadingWidth: double.infinity,
                backgroundColor: context.colors.backgroundPrimary,
                leading: const CategoryListView(),
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

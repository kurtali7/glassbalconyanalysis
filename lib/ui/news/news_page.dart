import 'package:glassbalconyanalysis/foundation/extension/async_snapshot.dart';
import 'package:glassbalconyanalysis/ui/news/article_item.dart';
import 'package:glassbalconyanalysis/ui/component/loading/container_with_loading.dart';
import 'package:glassbalconyanalysis/ui/loading_state_view_model.dart';
import 'package:glassbalconyanalysis/ui/news/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final homeViewModel = ref.watch(newsViewModelProvider);
    final news = ref.watch(newsViewModelProvider.select((value) => value.news));

    final snapshot = useFuture(
      useMemoized(() {
        return ref.watch(loadingStateProvider)
            .whileLoading(homeViewModel.fetchNews);
      }, [news?.toString()]),
    );

    return ContainerWithLoading(
      child: snapshot.isWaiting || news == null
          ? const SizedBox()
          : news.when(success: (data) {
              if (data.articles.isEmpty) {
                return Center(child: Text("noResult"));
              }
              return RefreshIndicator(
                onRefresh: () async => homeViewModel.fetchNews(),
                child: ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (_, index) {
                    return ArticleItem(article: data.articles[index]);
                  },
                ),
              );
            }, failure: (e) {
              return Center(child: Text("fetchFailed"));
            }),
    );
  }
}

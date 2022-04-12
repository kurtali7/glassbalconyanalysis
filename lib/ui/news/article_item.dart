import 'package:glassbalconyanalysis/data/model/article.dart';
import 'package:glassbalconyanalysis/ui/component/image/image.dart';
import 'package:glassbalconyanalysis/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ArticleItem extends HookConsumerWidget {
  const ArticleItem({
    required this.article,
  });

  final Article article;

  static BorderRadius borderRadiusAll = BorderRadius.circular(8);
  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final theme = ref.watch(appThemeProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusAll),
      elevation: 4,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Hero(
              tag: article,
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: borderRadiusTop,
                  child: networkImage(article.urlToImage, fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                article.title ?? "noTitle",
                style: theme.textTheme.h20.dense(),
              ),
            ),
          ],
        ),
        onTap: () => {

        },
      ),
    );
  }
}

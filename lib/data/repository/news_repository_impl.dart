import 'dart:math';

import 'package:glassbalconyanalysis/data/model/news.dart';
import 'package:glassbalconyanalysis/data/model/result.dart';
import 'package:glassbalconyanalysis/data/remote/news_data_source.dart';
import 'package:glassbalconyanalysis/data/repository/news_repository.dart';
import 'package:glassbalconyanalysis/foundation/constants.dart';
import 'package:glassbalconyanalysis/foundation/extension/date_time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsRepositoryProvider = Provider((ref) => NewsRepositoryImpl(ref.read));

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._reader);

  final Reader _reader;

  late final NewsDataSource _dataSource = _reader(newsDataSourceProvider);

  @override
  Future<Result<News>> getNews() {
    return Result.guardFuture(
      () async => await _dataSource.getNews(
        query: ['anim', 'manga'][Random().nextInt(2)],
        // For checking reload.
        from: DateTime.now()
            .subtract(const Duration(days: 28))
            .toLocal()
            .formatYYYYMMdd(),
        apiKey: Constants.instance.apiKey,
      ),
    );
  }
}

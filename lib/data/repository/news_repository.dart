import 'package:glassbalconyanalysis/data/model/news.dart';
import 'package:glassbalconyanalysis/data/model/result.dart';

abstract class NewsRepository {
  Future<Result<News>> getNews();
}

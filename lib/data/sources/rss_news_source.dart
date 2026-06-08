import 'package:dio/dio.dart';
import 'package:otto_news/data/models/article_model.dart';
import 'package:webfeed/webfeed.dart';

class RssNewsSource {
  final Dio _dio;
  RssNewsSource(this._dio);
  
  Future<List<ArticleModel>> fetchArticles(String feedUrl) async {
    final response = await _dio.get(feedUrl);

    final feed = RssFeed.parse(response.data);

    return feed.items!.map((item) => ArticleModel.fromRss(item)).toList();
  }
}
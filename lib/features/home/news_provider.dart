import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otto_news/data/models/article_model.dart';
import 'package:otto_news/data/sources/rss_news_source.dart';

class NewsProvider extends ChangeNotifier {
  List<ArticleModel> listNews = [];

  final Dio _dio;
  late final RssNewsSource _rssSource;
  List<String> urls = [
    'https://www.dp.ru/news.rss',
    'https://ria.ru/export/rss2/archive/index.xml',
    'https://rg.ru/xml/index.xml',
  ];

  Future<void> loadNews() async {
    listNews.clear();
    for (var el in urls) {
      final data = await _rssSource.fetchArticles(el);
      if (data.isNotEmpty) listNews.addAll(data);
    }
    listNews.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    if (hasListeners) notifyListeners();
  }

  NewsProvider({required Dio dio}) : _dio = dio {
    _rssSource = RssNewsSource(_dio);
  }
}
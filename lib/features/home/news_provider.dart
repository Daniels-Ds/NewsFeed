import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otto_news/data/models/article_model.dart';
import 'package:otto_news/data/sources/rss_news_source.dart';

class NewsProvider extends ChangeNotifier {
  List<ArticleModel> listNews = [];

  final Dio _dio;
  late final RssNewsSource _rssSource;

  Future<void> loadNews() async {
    listNews = await _rssSource.fetchArticles('https://www.dp.ru/news.rss');
    notifyListeners();
  }

  NewsProvider({required Dio dio}) : _dio = dio {
    _rssSource = RssNewsSource(_dio);
  }
}
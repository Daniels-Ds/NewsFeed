import 'package:webfeed/webfeed.dart';

class ArticleModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishedAt;
  final String isSource;
  final String link;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    publishedAt: json['publishedAt'],
    link: json['link'],
    isSource: json['link'],
  );

  factory ArticleModel.fromRss(RssItem item) => ArticleModel(
    id : item.guid ?? item.link ?? '',
    title : item.title ?? '',
    description : item.description ?? '',
    imageUrl : item.enclosure != null ? item.enclosure!.url.toString() 
  : '',
    publishedAt : item.pubDate ?? DateTime.now(),
    link: item.link ?? '',
    isSource: Uri.parse(item.link!).host.toString(),
  );

  ArticleModel({required this.id, required this.title, required this.description, required this.imageUrl, required this.publishedAt, required this.link, required this.isSource});
}
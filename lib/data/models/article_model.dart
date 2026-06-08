import 'package:webfeed/webfeed.dart';

class ArticleModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String link;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    publishedAt: json['publishedAt'],
    link: json['link'],
  );

  factory ArticleModel.fromRss(RssItem item) => ArticleModel(
    id : item.guid ?? item.link ?? '',
    title : item.title ?? '',
    description : item.description ?? '',
    imageUrl : item.enclosure != null ? item.enclosure!.url.toString() 
  : '',
    publishedAt : item.pubDate?.toString() ?? '',
    link: item.link ?? '',
  );

  ArticleModel({required this.id, required this.title, required this.description, required this.imageUrl, required this.publishedAt, required this.link});
}
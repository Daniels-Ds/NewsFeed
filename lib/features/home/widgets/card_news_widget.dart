import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/core/theme/constant/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/theme/app_theme.dart';
import '../../../core/config/router.dart';

class CardNewsWidget extends StatelessWidget {
  final String urlImage;
  final String? isSource;
  final String newsTitle;
  final String? description;
  final DateTime time;
  const CardNewsWidget({
    super.key, 
    required this.urlImage, 
    this.isSource,
    required this.newsTitle, 
    required this.time, this.description
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.detailsPath),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardImageWidget(urlImage: urlImage,),
            _CardInfoWidget(
              description: description,
              isSource: isSource ?? '', 
              newsTitle: newsTitle, 
              time: time, 
            ),
          ],
        ),
      )
    );
  }
}

class _CardInfoWidget extends StatelessWidget {
  final String? isSource;
  final String newsTitle;
  final String? description;
  final DateTime time;
  const _CardInfoWidget({
    required this.isSource, 
    required this.newsTitle, 
    required this.time, required this.description
  });

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ru', timeago.RuMessages());
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(newsTitle, maxLines: 3, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.titleLarge),
          SizedBox(height: 15),
          if(description!.isNotEmpty) Text(description!, maxLines: 2, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.bodyMedium),
          if(description!.isNotEmpty) SizedBox(height: 15),
          Row(
            children: [
              if (isSource!.isNotEmpty) Text(isSource!, style: AppTheme.themeData.textTheme.titleSmall),
              SizedBox(width: 10),
              Text('•'),
              SizedBox(width: 10),
              Text(
                timeago.format(time, locale: 'ru'), style: AppTheme.themeData.textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardImageWidget extends StatelessWidget {
  final String? urlImage;
  const _CardImageWidget({
    required this.urlImage
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomLeft,
      children: [
        SizedBox(
          height: 300,
          child: Image.network(
            urlImage?.isNotEmpty == true ? urlImage! : 'https://avatars.mds.yandex.net/i?id=2a89487ea076371488e7e5c6e34fa3de_l-7045543-images-thumbs&n=13',
            fit: BoxFit.cover,
            width: double.infinity,
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 10),
            decoration: BoxDecoration(
              color: ColorsApp.tabColorNavBar,
              borderRadius: BorderRadius.circular(20)
            ),
            height: 30,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Iconic.circle_solid, color: Colors.white, size: 10, ),
                  Text('Новинка', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),
            ),
          )
      ]
    );
  }
}
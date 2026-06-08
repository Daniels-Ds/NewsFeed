import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/constant/styles.dart';
import '../../../core/config/router.dart';

class CardNewsWidget extends StatelessWidget {
  final String urlImage;
  final String? isSource;
  final String newsTitle;
  final DateTime time;
  const CardNewsWidget({
    super.key, 
    required this.urlImage, 
    this.isSource,
    required this.newsTitle, 
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.detailsPath),
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxStyles.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardImageWidget(urlImage: urlImage,),
            _CardInfoWidget(
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
  final DateTime time;
  const _CardInfoWidget({
    required this.isSource, 
    required this.newsTitle, 
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 220,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSource!.isNotEmpty) Text(isSource!, style: AppTheme.themeData.textTheme.titleSmall),
          SizedBox(height: 10),
          Text(newsTitle, maxLines: 3, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.titleMedium),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('dd.MM.yyyy HH:mm').format(time), style: AppTheme.themeData.textTheme.titleSmall),
              // Text('${time.hour}:${time.minute}', style: AppTheme.themeData.textTheme.titleSmall),
              // Text('${time.day}.${time.month}.${time.year}', style: AppTheme.themeData.textTheme.titleSmall)
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
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 120,
      decoration: BoxStyles.imageInCardDecoration, 
      child: Image.network(
        urlImage?.isNotEmpty == true ? urlImage! : 'https://avatars.mds.yandex.net/i?id=2a89487ea076371488e7e5c6e34fa3de_l-7045543-images-thumbs&n=13',
        fit: BoxFit.cover,
        width: double.infinity,
        ));
  }
}
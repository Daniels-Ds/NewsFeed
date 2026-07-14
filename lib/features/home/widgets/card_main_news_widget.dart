import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/constant/styles.dart';
import '../../../core/config/router.dart';
import '../../../core/global_widgets/image_widget.dart';

class CardMainNewsWidget extends StatelessWidget {
  final String urlImage;
  final String? discription;
  final String newsTitle;
  final DateTime time;
  final String? author;
  const CardMainNewsWidget({
    super.key, 
    required this.urlImage, 
    required this.discription, 
    required this.newsTitle, 
    required this.time, 
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.detailsPath),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxStyles.cardDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            urlImage.isNotEmpty ?
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CardImageWidget(urlImage: urlImage,),
              )) : SizedBox(),
            Flexible(
              flex: 2,
              child: _CardInfoWidget(
                discription: discription, 
                newsTitle: newsTitle, 
                time: time, 
                author: author!, 
              ),
            ),
          ],
        ),
      )
    );
  }
}

class _CardInfoWidget extends StatelessWidget {
  final String? discription;
  final String newsTitle;
  final DateTime time;
  final String? author;
  const _CardInfoWidget({
    required this.discription, 
    required this.newsTitle, 
    required this.time,
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ru', timeago.RuMessages());
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          Text(newsTitle, maxLines: 2, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.headlineSmall,),
          SizedBox(height: 5),
          Row(
            children: [
              author!.isNotEmpty ? Text(author!, style: AppTheme.themeData.textTheme.titleSmall) : SizedBox(),
              SizedBox(width: 5),
              Text('•', style: AppTheme.themeData.textTheme.titleSmall,),
              SizedBox(width: 5),
              Text(timeago.format(time, locale: 'ru'), style: AppTheme.themeData.textTheme.titleSmall,)
            ],
          )
          
        ],
      ),
    );
  }
}


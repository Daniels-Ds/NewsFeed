import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/constant/styles.dart';

class CardNewsWidget extends StatelessWidget {
  final String urlImage;
  final String urlLogo;
  final String newsTitle;
  final String time;
  const CardNewsWidget({
    super.key, 
    required this.urlImage, 
    required this.urlLogo, 
    required this.newsTitle, 
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxStyles.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardImageWidget(urlImage: urlImage,),
          _CardInfoWidget(
            urlLogo: urlLogo, 
            newsTitle: newsTitle, 
            time: time, 
          ),
        ],
      ),
    );
  }
}

class _CardInfoWidget extends StatelessWidget {
  final String urlLogo;
  final String newsTitle;
  final String time;
  const _CardInfoWidget({
    required this.urlLogo, 
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
          Image.network(
            height: 14,
            fit: BoxFit.contain,
            urlLogo),
          SizedBox(height: 10),
          Text(newsTitle, maxLines: 3, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.titleMedium),
          Spacer(),
          Text(time, style: AppTheme.themeData.textTheme.titleSmall)
        ],
      ),
    );
  }
}

class _CardImageWidget extends StatelessWidget {
  final String urlImage;
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
        urlImage,
        fit: BoxFit.cover,
        width: double.infinity,
        ));
  }
}
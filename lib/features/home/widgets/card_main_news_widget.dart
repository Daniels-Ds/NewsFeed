import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/constant/styles.dart';
import '../../../core/config/router.dart';
import '../../../core/global_widgets/image_widget.dart';

class CardMainNewsWidget extends StatelessWidget {
  final String urlImage;
  final String urlLogo;
  final String newsTitle;
  final String time;
  const CardMainNewsWidget({
    super.key, 
    required this.urlImage, 
    required this.urlLogo, 
    required this.newsTitle, 
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.detailsPath),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxStyles.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImageWidget(urlImage: urlImage,),
            _CardInfoWidget(
              urlLogo: urlLogo, 
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
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            height: 18,
            fit: BoxFit.contain,
            urlLogo),
          SizedBox(height: 10),
          Text(newsTitle, maxLines: 2, overflow: TextOverflow.ellipsis , style: AppTheme.themeData.textTheme.headlineSmall,),
          SizedBox(height: 15),
          Text(time, style: AppTheme.themeData.textTheme.titleSmall,)
        ],
      ),
    );
  }
}


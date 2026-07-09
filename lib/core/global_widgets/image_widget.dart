import 'package:flutter/material.dart';

import '../theme/constant/styles.dart';

class CardImageWidget extends StatelessWidget {
  final String? urlImage;
  const CardImageWidget({super.key, 
    required this.urlImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 200,
      decoration: BoxStyles.imageInCardDecoration, 
      child: Image.network(
        urlImage?.isNotEmpty == true ? urlImage! : 'https://avatars.mds.yandex.net/i?id=2a89487ea076371488e7e5c6e34fa3de_l-7045543-images-thumbs&n=13',
        fit: BoxFit.cover,
        width: double.infinity,
        ));
  }
}
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
      height: 100,
      decoration: BoxStyles.imageInCardDecoration, 
      child: Image.network(
        urlImage?.isNotEmpty == true ? urlImage! : '',
        fit: BoxFit.cover,
        width: double.infinity,
        ));
  }
}
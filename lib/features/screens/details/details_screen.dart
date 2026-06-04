import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/features/global_widgets/image_widget.dart';
import 'package:otto_news/theme/constant/colors.dart';

import '../../../theme/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            }, 
            icon: isFavorite ? Icon(Iconic.bookmark_solid, color: ColorsApp.favoriteColor,) : Icon(Iconic.bookmark))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.network(
                    alignment: AlignmentGeometry.centerLeft,
                    'https://avatars.mds.yandex.net/i?id=90453a5d5597ea953a4faad766c5ff840ab7e892-7012253-images-thumbs&n=13',
                    height: 18,
                    fit: BoxFit.contain,
                  ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 10)),
              SliverToBoxAdapter(
                child: Text('Пожар в Нотр-Даме: загорелся собор',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis, 
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 10)),
              SliverToBoxAdapter(
                child: Text('1 час назад',
                  style: AppTheme.themeData.textTheme.titleSmall,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverToBoxAdapter(
                child: CardImageWidget(urlImage: 'https://s.yimg.com/ny/api/res/1.2/sEryaP5I7cHu5iekhpHU3Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD04OTE7Y2Y9d2VicA--/https://media.zenfs.com/en/deadline.com/095af09c6f8ac7661113f1ab566cdf54')
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverToBoxAdapter(child: _DescriptionDetailPageWidget(
                description: 'В центре Парижа произошёл крупный пожар в соборе Парижской Богоматери. Огонь охватил шпиль здания и быстро распространился на крышу. \n\nПо предварительным данным, пострадавших нет. Причины возгорания устанавливаются',)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Spacer(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _DeferredDetailPageButtonWidget(),
                        _ShareDetailPageButtonWidget(),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionDetailPageWidget extends StatelessWidget {
  final String description;
  const _DescriptionDetailPageWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      softWrap: true,
      style: AppTheme.themeData.textTheme.bodyMedium,
      );
  }
}

class _DeferredDetailPageButtonWidget extends StatefulWidget {
  const _DeferredDetailPageButtonWidget();

  @override
  State<_DeferredDetailPageButtonWidget> createState() => _DeferredDetailPageButtonWidgetState();
}

class _DeferredDetailPageButtonWidgetState extends 
State<_DeferredDetailPageButtonWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      }, 
      child: Row(
        children: [
          isSelected ? Icon(Iconic.clock_solid, color: ColorsApp.deferredColor) : Icon(Iconic.clock),
          SizedBox(width: 10),
          Text(isSelected ? 'Отложено' : 'Отложить', style: AppTheme.themeData.textTheme.labelMedium),
        ],
      )
    );
  }
}

class _ShareDetailPageButtonWidget extends StatelessWidget {
  const _ShareDetailPageButtonWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, 
      child: Icon(Iconic.redo)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/core/theme/app_theme.dart';
import 'package:otto_news/features/home/news_provider.dart';
import 'package:provider/provider.dart';
import '../../core/global_widgets/app_bar_title_widget.dart';
import 'widgets/card_news_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
      context.read<NewsProvider>().loadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewsProvider>();
    return Center(
      child: RefreshIndicator(
        edgeOffset: 80,
        displacement: 20,
        strokeWidth: 3,
        onRefresh: model.loadNews,
        child: CustomScrollView(
          slivers: [
            _AppBarWidget(),
            SliverPadding(padding: EdgeInsets.only(top: 10)),
            // SliverToBoxAdapter(
            //   child: CardMainNewsWidget(
            //       urlImage: 'https://s.yimg.com/ny/api/res/1.2/sEryaP5I7cHu5iekhpHU3Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD04OTE7Y2Y9d2VicA--/https://media.zenfs.com/en/deadline.com/095af09c6f8ac7661113f1ab566cdf54', 
            //       urlLogo: 'https://avatars.mds.yandex.net/i?id=90453a5d5597ea953a4faad766c5ff840ab7e892-7012253-images-thumbs&n=13', 
            //       newsTitle: 'Пожар в Нотр-Даме: загорелся собор', 
            //       time: '1 час назад',      
            //   ),
            // ),
            // SliverToBoxAdapter(child: _SectionNameWidget(sectionTitle: 'Популярное'),),
            SliverList.separated(
            itemCount: model.listNews.length,
            itemBuilder: (BuildContext context, index) {
              return CardNewsWidget(newsTitle: model.listNews[index].title, urlImage: model.listNews[index].imageUrl, time: model.listNews[index].publishedAt,);
            }, 
            separatorBuilder: (BuildContext context, index) {
              return SizedBox(height: 10,);
            }),
            SliverPadding(padding: EdgeInsets.only(top: 80)),
          ],
        ),
      ),
    );
  }
}

class _SectionNameWidget extends StatelessWidget {
  final String sectionTitle;
  const _SectionNameWidget({required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sectionTitle, style: AppTheme.themeData.textTheme.headlineMedium,),
        SizedBox(width: 10),
        Icon(Iconic.angle_small_right, size: 13, fontWeight: FontWeight.bold),
      ],
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      titleSpacing: 10,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _TextDateWidget(),
          const SizedBox(height: 10),
          AppBarTitleWidget(title: 'Главные новости',),
        ],
      ),
    );
  }
}

class _TextDateWidget extends StatelessWidget {
  const _TextDateWidget();

  @override
  Widget build(BuildContext context) {
    return Text('Понедельник, 26 мая', 
      style: AppTheme.themeData.textTheme.titleSmall,
      );
  }
}

Future<void> _fetchNewData() async {
  await Future.delayed(const Duration(seconds: 2));
}
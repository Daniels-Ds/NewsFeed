import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var firstNew = model.listNews.where((el) => el.imageUrl.isNotEmpty && el.description.isNotEmpty);
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
            // SliverToBoxAdapter(child: _SectionNameWidget(sectionTitle: 'Популярное'),),
            SliverToBoxAdapter(
              child: 
              model.listNews.isNotEmpty ? CardNewsWidget(newsTitle: firstNew.first.title, urlImage: firstNew.first.imageUrl, time: firstNew.first.publishedAt, isSource: firstNew.first.isSource, description: firstNew.first.description,) : SizedBox(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                
              ],
            )
            // SliverList.separated(
            // itemCount: model.listNews.length,
            // itemBuilder: (BuildContext context, index) {
            //   if (index >= model.listNews.length) return const SizedBox();
            //   return CardNewsWidget(newsTitle: model.listNews[index].title, urlImage: model.listNews[index].imageUrl, time: model.listNews[index].publishedAt, isSource: model.listNews[index].isSource,);
            // }, 
            // separatorBuilder: (BuildContext context, index) {
            //   return SizedBox(height: 10,);
            // }),
            SliverPadding(padding: EdgeInsets.only(top: 80)),
          ],
        ),
      ),
    );
  }
}

// class _SectionNameWidget extends StatelessWidget {
//   final String sectionTitle;
//   const _SectionNameWidget({required this.sectionTitle});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(sectionTitle, style: AppTheme.themeData.textTheme.headlineMedium,),
//         SizedBox(width: 10),
//         Icon(Iconic.angle_small_right, size: 13, fontWeight: FontWeight.bold),
//       ],
//     );
//   }
// }

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
    return Text(DateFormat('EEEE, d MMMM', 'ru').format(DateTime.now()).toUpperCase(),
      style: AppTheme.themeData.textTheme.titleSmall
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otto_news/core/theme/app_theme.dart';
import 'package:otto_news/core/theme/constant/colors.dart';
import 'package:otto_news/data/models/article_model.dart';
import 'package:otto_news/features/home/news_provider.dart';
import 'package:otto_news/features/home/widgets/card_main_news_widget.dart';
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

  final List<String> category = [
    "Все новости",
    "Экономика",
    "Спорт",
    "Автомобили",
    "Сельхозхозяйство",
    "Психология",
    "Музыка",
    "Еда",
    "Образование",
    "Политика",
  ];

  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
  
  final model = context.watch<NewsProvider>();
  final listNews = model.listNews;
  var firstNew = model.listNews.where((el) => el.imageUrl.isNotEmpty && el.description.isNotEmpty);

    return Center(
      child: RefreshIndicator(
        edgeOffset: 80,
        displacement: 20,
        strokeWidth: 3,
        onRefresh: model.loadNews,
        child: 
        model.listNews.isEmpty ? 
        Center(
          child: 
          CircularProgressIndicator(color: ColorsApp.tabColorNavBar,)) :
          CustomScrollView(
            slivers: [
              _AppBarWidget(),
              SliverPadding(padding: EdgeInsets.only(top: 10)),
              SliverToBoxAdapter(
                child: 
                model.listNews.isNotEmpty ? CardNewsWidget(newsTitle: firstNew.first.title, urlImage: firstNew.first.imageUrl, time: firstNew.first.publishedAt, isSource: firstNew.first.isSource, description: firstNew.first.description,) : SizedBox(),
              ),
              SliverToBoxAdapter(child: 
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, bottom: 30),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < category.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedIndex != i) {
                                  setState(() => selectedIndex = i);
                                }
                              },
                              child: CategoryChoiceWidget(
                                toggle: selectedIndex == i,
                                titleCategory: category[i],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                SliverList.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return model.listNews.isNotEmpty ? CardMainNewsWidget(urlImage: listNews[index].imageUrl, discription: listNews[index].description, newsTitle: listNews[index].title, time: listNews[index].publishedAt, author: listNews[index].isSource) : SizedBox();
                  },
                  itemCount: model.listNews.length),
              SliverPadding(padding: EdgeInsets.only(top: 80)),
            ],
          ),
      ),
    );
  }
}

class CategoryChoiceWidget extends StatelessWidget {
  final bool toggle;
  final String titleCategory;
  const CategoryChoiceWidget({
    super.key, required this.titleCategory, required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: toggle ? ColorsApp.mainTextColor : ColorsApp.seconBbgColor,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(titleCategory, style: toggle ? AppTheme.themeData.textTheme.labelSmall : AppTheme.themeData.textTheme.bodySmall),
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
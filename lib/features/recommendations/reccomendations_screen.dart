import 'package:flutter/material.dart';
import '../../core/global_widgets/app_bar_title_widget.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: AppBarTitleWidget(title: 'Для вас',),
            )
          ],
        ),
      ),
    );
  }
}
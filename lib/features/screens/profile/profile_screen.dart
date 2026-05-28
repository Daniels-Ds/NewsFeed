import 'package:flutter/material.dart';
import '../../global_widgets/app_bar_title_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: AppBarTitleWidget(title: 'Настройки',),
            )
          ],
        ),
      ),
    );
  }
}
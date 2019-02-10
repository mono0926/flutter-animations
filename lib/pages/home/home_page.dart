import 'package:animations/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations/widget/app_list_tile.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animation',
      child: ListView(
        children: [
          const AppListTile(
            title: 'ImplicitlyAnimated',
            nextRouteName: ImplicitlyAnimatedPage.routeName,
          ),
        ],
      ),
    );
  }
}

import 'package:animations/pages/implicitly_animated/animated_align_page.dart';
import 'package:animations/pages/implicitly_animated/animated_container_page.dart';
import 'package:animations/widget/app_list_tile.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Examples of [ImplicitlyAnimatedWidget]
class ImplicitlyAnimatedPage extends StatelessWidget {
  static const routeName = 'implicitlyAnimated';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animated',
      child: ListView(
        children: [
          const AppListTile(
            title: 'AnimatedAlign',
            nextRouteName: AnimatedAlignPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedContainer',
            nextRouteName: AnimatedContainerPage.routeName,
          )
        ],
      ),
    );
  }
}

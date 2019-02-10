import 'package:animations/pages/implicitly_animated/animated_align.dart';
import 'package:animations/pages/implicitly_animated/animated_container.dart';
import 'package:animations/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations/pages/implicitly_animated/animated_icon.dart';
import 'package:animations/pages/implicitly_animated/animated_list.dart';
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
          ),
          const AppListTile(
            title: 'AnimatedCrossFade',
            nextRouteName: AnimatedCrossFadePage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedDefaultTextStyle',
            nextRouteName: AnimatedDefaultTextStylePage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedIcon',
            nextRouteName: AnimatedIconPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedList',
            nextRouteName: AnimatedListPage.routeName,
          ),
        ],
      ),
    );
  }
}

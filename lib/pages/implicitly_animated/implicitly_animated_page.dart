import 'package:animations/pages/implicitly_animated/animated_align.dart';
import 'package:animations/pages/implicitly_animated/animated_container.dart';
import 'package:animations/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations/pages/implicitly_animated/animated_icon.dart';
import 'package:animations/pages/implicitly_animated/animated_list.dart';
import 'package:animations/pages/implicitly_animated/animated_modal_barrier.dart';
import 'package:animations/pages/implicitly_animated/animated_opacity.dart';
import 'package:animations/pages/implicitly_animated/animated_padding.dart';
import 'package:animations/pages/implicitly_animated/animated_physical_model.dart';
import 'package:animations/pages/implicitly_animated/animated_positioned.dart';
import 'package:animations/pages/implicitly_animated/animated_positioned_directional.dart';
import 'package:animations/pages/implicitly_animated/animated_size_page.dart';
import 'package:animations/pages/implicitly_animated/animated_switcher_page.dart';
import 'package:animations/pages/implicitly_animated/animated_theme_page.dart';
import 'package:animations/pages/implicitly_animated/fade_in_image_page.dart';
import 'package:animations/pages/implicitly_animated/hero_page.dart';
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
          const AppListTile(
            title: 'AnimatedModalBarrier',
            nextRouteName: AnimatedModalBarrierPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedOpacity',
            nextRouteName: AnimatedOpacityPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedPadding',
            nextRouteName: AnimatedPaddingPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedPhysicalModel',
            nextRouteName: AnimatedPhysicalModelPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedPositioned',
            nextRouteName: AnimatedPositionedPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedPositionedDirectional',
            nextRouteName: AnimatedPositionedDirectionalPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedTheme',
            nextRouteName: AnimatedThemePage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedSwitcher',
            nextRouteName: AnimatedSwitcherPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedSize',
            nextRouteName: AnimatedSizePage.routeName,
          ),
          const AppListTile(
            title: 'Hero',
            nextRouteName: HeroPage.routeName,
          ),
          const AppListTile(
            title: 'FadeInImage',
            nextRouteName: FadeInImagePage.routeName,
          ),
        ],
      ),
    );
  }
}

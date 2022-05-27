import 'package:animations_app/pages/implicitly_animated/animated_align.dart';
import 'package:animations_app/pages/implicitly_animated/animated_container.dart';
import 'package:animations_app/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations_app/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations_app/pages/implicitly_animated/animated_icon.dart';
import 'package:animations_app/pages/implicitly_animated/animated_list.dart';
import 'package:animations_app/pages/implicitly_animated/animated_modal_barrier.dart';
import 'package:animations_app/pages/implicitly_animated/animated_opacity.dart';
import 'package:animations_app/pages/implicitly_animated/animated_padding.dart';
import 'package:animations_app/pages/implicitly_animated/animated_physical_model.dart';
import 'package:animations_app/pages/implicitly_animated/animated_positioned.dart';
import 'package:animations_app/pages/implicitly_animated/animated_positioned_directional.dart';
import 'package:animations_app/pages/implicitly_animated/animated_size_page.dart';
import 'package:animations_app/pages/implicitly_animated/animated_switcher_page.dart';
import 'package:animations_app/pages/implicitly_animated/animated_theme_page.dart';
import 'package:animations_app/pages/implicitly_animated/fade_in_image_page.dart';
import 'package:animations_app/pages/implicitly_animated/hero_page.dart';
import 'package:animations_app/widget/app_list_tile.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Examples of [ImplicitlyAnimatedWidget]
class ImplicitlyAnimatedPage extends StatelessWidget {
  const ImplicitlyAnimatedPage({super.key});

  static const routeName = 'implicitlyAnimated';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animated',
      child: ListView(
        children: const [
          AppListTile(
            title: 'AnimatedAlign',
            nextRouteName: AnimatedAlignPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedContainer',
            nextRouteName: AnimatedContainerPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedCrossFade',
            nextRouteName: AnimatedCrossFadePage.routeName,
          ),
          AppListTile(
            title: 'AnimatedDefaultTextStyle',
            nextRouteName: AnimatedDefaultTextStylePage.routeName,
          ),
          AppListTile(
            title: 'AnimatedIcon',
            nextRouteName: AnimatedIconPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedList',
            nextRouteName: AnimatedListPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedModalBarrier',
            nextRouteName: AnimatedModalBarrierPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedOpacity',
            nextRouteName: AnimatedOpacityPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedPadding',
            nextRouteName: AnimatedPaddingPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedPhysicalModel',
            nextRouteName: AnimatedPhysicalModelPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedPositioned',
            nextRouteName: AnimatedPositionedPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedPositionedDirectional',
            nextRouteName: AnimatedPositionedDirectionalPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedTheme',
            nextRouteName: AnimatedThemePage.routeName,
          ),
          AppListTile(
            title: 'AnimatedSwitcher',
            nextRouteName: AnimatedSwitcherPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedSize',
            nextRouteName: AnimatedSizePage.routeName,
          ),
          AppListTile(
            title: 'Hero',
            nextRouteName: HeroPage.routeName,
          ),
          AppListTile(
            title: 'FadeInImage',
            nextRouteName: FadeInImagePage.routeName,
          ),
        ],
      ),
    );
  }
}

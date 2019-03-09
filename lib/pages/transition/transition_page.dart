import 'package:animations/pages/transition/fade_transition_page.dart';
import 'package:animations/pages/transition/positioned_transition_page.dart';
import 'package:animations/pages/transition/relative_positioned_transition_page.dart';
import 'package:animations/pages/transition/rotation_transition_page.dart';
import 'package:animations/pages/transition/scale_transition_page.dart';
import 'package:animations/pages/transition/size_transition_page.dart';
import 'package:animations/pages/transition/slide_transition_page.dart';
import 'package:animations/widget/app_list_tile.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Examples of [TransitionPage]
class TransitionPage extends StatelessWidget {
  static const routeName = 'TransitionPage';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'TransitionPage',
      child: ListView(
        children: [
          const AppListTile(
            title: 'SlideTransition',
            nextRouteName: SlideTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'ScaleTransition',
            nextRouteName: ScaleTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'RotationTransition',
            nextRouteName: RotationTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'SizeTransition',
            nextRouteName: SizeTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'FadeTransition',
            nextRouteName: FadeTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'PositionedTransition',
            nextRouteName: PositionedTransitionPage.routeName,
          ),
          const AppListTile(
            title: 'RelativePositionedTransition',
            nextRouteName: RelativePositionedTransitionPage.routeName,
          ),
        ],
      ),
    );
  }
}

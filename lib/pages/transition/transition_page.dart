import 'package:animations_app/pages/transition/align_transition_page.dart';
import 'package:animations_app/pages/transition/decorated_box_transition_page.dart';
import 'package:animations_app/pages/transition/default_text_style_transition_page.dart';
import 'package:animations_app/pages/transition/fade_transition_page.dart';
import 'package:animations_app/pages/transition/positioned_transition_page.dart';
import 'package:animations_app/pages/transition/relative_positioned_transition_page.dart';
import 'package:animations_app/pages/transition/rotation_transition_page.dart';
import 'package:animations_app/pages/transition/scale_transition_page.dart';
import 'package:animations_app/pages/transition/size_transition_page.dart';
import 'package:animations_app/pages/transition/slide_transition_page.dart';
import 'package:animations_app/widget/app_list_tile.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Examples of [TransitionPage]
class TransitionPage extends StatelessWidget {
  const TransitionPage({super.key});

  static const routeName = 'TransitionPage';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'TransitionPage',
      child: ListView(
        children: const [
          AppListTile(
            title: 'AlignTransition',
            nextRouteName: AlignTransitionPage.routeName,
          ),
          AppListTile(
            title: 'DecoratedBoxTransition',
            nextRouteName: DecoratedBoxTransitionPage.routeName,
          ),
          AppListTile(
            title: 'DefaultTextStyleTransition',
            nextRouteName: DefaultTextStyleTransitionPage.routeName,
          ),
          AppListTile(
            title: 'FadeTransition',
            nextRouteName: FadeTransitionPage.routeName,
          ),
          AppListTile(
            title: 'PositionedTransition',
            nextRouteName: PositionedTransitionPage.routeName,
          ),
          AppListTile(
            title: 'RelativePositionedTransition',
            nextRouteName: RelativePositionedTransitionPage.routeName,
          ),
          AppListTile(
            title: 'RotationTransition',
            nextRouteName: RotationTransitionPage.routeName,
          ),
          AppListTile(
            title: 'ScaleTransition',
            nextRouteName: ScaleTransitionPage.routeName,
          ),
          AppListTile(
            title: 'SizeTransition',
            nextRouteName: SizeTransitionPage.routeName,
          ),
          AppListTile(
            title: 'SlideTransition',
            nextRouteName: SlideTransitionPage.routeName,
          ),
        ],
      ),
    );
  }
}

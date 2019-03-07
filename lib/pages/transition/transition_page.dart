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
        ],
      ),
    );
  }
}

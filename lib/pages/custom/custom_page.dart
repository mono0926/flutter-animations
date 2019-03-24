import 'package:animations/pages/custom/animated_builder_page.dart';
import 'package:animations/pages/custom/animated_switcher_page.dart';
import 'package:animations/pages/custom/animated_widget_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_enhanced2_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_enhanced_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_page.dart';
import 'package:animations/pages/custom/implicitly_animated_widget_page.dart';
import 'package:animations/widget/app_list_tile.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  static const routeName = 'Custom';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Custom',
      child: ListView(
        children: [
          const AppListTile(
            title: 'AnimationController - SetState',
            nextRouteName: AnimationControllerSetStatePage.routeName,
          ),
          const AppListTile(
            title: 'AnimationController - SetState (Enhanced)',
            nextRouteName: AnimationControllerSetStateEnhancedPage.routeName,
          ),
          const AppListTile(
            title: 'AnimationController - SetState (Enhanced2)',
            nextRouteName: AnimationControllerSetStateEnhanced2Page.routeName,
          ),
          const AppListTile(
            title: 'AnimatedWidget',
            nextRouteName: AnimatedWidgetPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedBuilder',
            nextRouteName: AnimatedBuilderPage.routeName,
          ),
          const AppListTile(
            title: 'AnimatedSwitcher',
            nextRouteName: AnimatedSwitcher2Page.routeName,
          ),
          const AppListTile(
            title: 'ImplicitlyAnimatedWidget',
            nextRouteName: ImplicitlyAnimatedWidgetPage.routeName,
          ),
        ],
      ),
    );
  }
}

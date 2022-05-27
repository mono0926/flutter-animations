import 'package:animations_app/pages/custom/animated_builder_page.dart';
import 'package:animations_app/pages/custom/animated_switcher_page.dart';
import 'package:animations_app/pages/custom/animated_widget_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_enhanced2_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_enhanced_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_page.dart';
import 'package:animations_app/pages/custom/implicitly_animated_widget_page.dart';
import 'package:animations_app/widget/app_list_tile.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  static const routeName = 'Custom';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Custom',
      child: ListView(
        children: const [
          AppListTile(
            title: 'AnimationController - SetState',
            nextRouteName: AnimationControllerSetStatePage.routeName,
          ),
          AppListTile(
            title: 'AnimationController - SetState (Enhanced)',
            nextRouteName: AnimationControllerSetStateEnhancedPage.routeName,
          ),
          AppListTile(
            title: 'AnimationController - SetState (Enhanced2)',
            nextRouteName: AnimationControllerSetStateEnhanced2Page.routeName,
          ),
          AppListTile(
            title: 'AnimatedWidget',
            nextRouteName: AnimatedWidgetPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedBuilder',
            nextRouteName: AnimatedBuilderPage.routeName,
          ),
          AppListTile(
            title: 'AnimatedSwitcher',
            nextRouteName: AnimatedSwitcher2Page.routeName,
          ),
          AppListTile(
            title: 'ImplicitlyAnimatedWidget',
            nextRouteName: ImplicitlyAnimatedWidgetPage.routeName,
          ),
        ],
      ),
    );
  }
}

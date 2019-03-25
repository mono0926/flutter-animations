import 'package:animations/pages/custom/custom_page.dart';
import 'package:animations/pages/flare/flare_page.dart';
import 'package:animations/pages/flight_search/flight_search_page.dart';
import 'package:animations/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations/pages/transition/transition_page.dart';
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
          const AppListTile(
            title: 'Transition',
            nextRouteName: TransitionPage.routeName,
          ),
          const AppListTile(
            title: 'Flight Search (Advanced Example)',
            nextRouteName: FlightSearchPage.routeName,
          ),
          const AppListTile(
            title: 'Custom',
            nextRouteName: CustomPage.routeName,
          ),
          const AppListTile(
            title: 'Flare',
            nextRouteName: FlarePage.routeName,
          ),
        ],
      ),
    );
  }
}

import 'package:animations_app/pages/custom/custom_page.dart';
import 'package:animations_app/pages/flare/flare_page.dart';
import 'package:animations_app/pages/flight_search/flight_search_page.dart';
import 'package:animations_app/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations_app/pages/transition/transition_page.dart';
import 'package:animations_app/widget/app_list_tile.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animation',
      child: ListView(
        children: const [
          AppListTile(
            title: 'ImplicitlyAnimated',
            nextRouteName: ImplicitlyAnimatedPage.routeName,
          ),
          AppListTile(
            title: 'Transition',
            nextRouteName: TransitionPage.routeName,
          ),
          AppListTile(
            title: 'Flight Search (Advanced Example)',
            nextRouteName: FlightSearchPage.routeName,
          ),
          AppListTile(
            title: 'Custom',
            nextRouteName: CustomPage.routeName,
          ),
          AppListTile(
            title: 'Flare',
            nextRouteName: FlarePage.routeName,
          ),
        ],
      ),
    );
  }
}

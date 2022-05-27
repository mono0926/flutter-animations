import 'package:animations_app/pages/flare/apple_lock_page.dart';
import 'package:animations_app/widget/app_list_tile.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class FlarePage extends StatelessWidget {
  const FlarePage({super.key});

  static const routeName = 'Flare';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Flare',
      child: ListView(
        children: const [
          AppListTile(
            title: 'Apple Lock',
            nextRouteName: AppleLockPage.routeName,
          ),
        ],
      ),
    );
  }
}

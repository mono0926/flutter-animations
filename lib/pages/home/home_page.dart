import 'package:animations/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animation',
      child: ListView(
        children: [
          ListTile(
            title: const Text('ImplicitlyAnimated'),
            onTap: () {
              Navigator.of(context).pushNamed(ImplicitlyAnimatedPage.routeName);
            },
          )
        ],
      ),
    );
  }
}

import 'package:animations/pages/animated/animated_page.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animated',
      child: ListView(
        children: [
          ListTile(
            title: const Text('Animated'),
            onTap: () {
              Navigator.of(context).pushNamed(AnimatedPage.routeName);
            },
          )
        ],
      ),
    );
  }
}

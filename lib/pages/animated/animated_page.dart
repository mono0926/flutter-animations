import 'package:animations/pages/animated/animated_align_page.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedPage extends StatelessWidget {
  static const routeName = 'animated';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Animated',
      child: ListView(
        children: [
          ListTile(
            title: const Text('AnimatedAlign'),
            onTap: () {
              Navigator.of(context).pushNamed(AnimatedAlignPage.routeName);
            },
          )
        ],
      ),
    );
  }
}

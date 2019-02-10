import 'package:animations/pages/implicitly_animated/animated_align_page.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class ImplicitlyAnimatedPage extends StatelessWidget {
  static const routeName = 'implicitlyAnimated';
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

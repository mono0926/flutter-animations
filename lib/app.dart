import 'package:animations/pages/home/home_page.dart';
import 'package:animations/pages/implicitly_animated/animated_align.dart';
import 'package:animations/pages/implicitly_animated/animated_container.dart';
import 'package:animations/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations/pages/implicitly_animated/animated_icon.dart';
import 'package:animations/pages/implicitly_animated/animated_list.dart';
import 'package:animations/pages/implicitly_animated/animated_modal_barrier.dart';
import 'package:animations/pages/implicitly_animated/animated_opacity.dart';
import 'package:animations/pages/implicitly_animated/animated_padding.dart';
import 'package:animations/pages/implicitly_animated/animated_physical_model.dart';
import 'package:animations/pages/implicitly_animated/animated_positioned.dart';
import 'package:animations/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      routes: {
        ImplicitlyAnimatedPage.routeName: (_context) =>
            ImplicitlyAnimatedPage(),
        AnimatedAlignPage.routeName: (_context) => AnimatedAlignPage(),
        AnimatedContainerPage.routeName: (_context) => AnimatedContainerPage(),
        AnimatedCrossFadePage.routeName: (_context) => AnimatedCrossFadePage(),
        AnimatedDefaultTextStylePage.routeName: (_context) =>
            AnimatedDefaultTextStylePage(),
        AnimatedIconPage.routeName: (_context) => AnimatedIconPage(),
        AnimatedListPage.routeName: (_context) => AnimatedListPage(),
        AnimatedModalBarrierPage.routeName: (_context) =>
            AnimatedModalBarrierPage(),
        AnimatedOpacityPage.routeName: (_context) => AnimatedOpacityPage(),
        AnimatedPaddingPage.routeName: (_context) => AnimatedPaddingPage(),
        AnimatedPhysicalModelPage.routeName: (_context) =>
            AnimatedPhysicalModelPage(),
        AnimatedPositionedPage.routeName: (_context) =>
            AnimatedPositionedPage(),
      },
    );
  }
}

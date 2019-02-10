import 'package:animations/pages/home/home_page.dart';
import 'package:animations/pages/implicitly_animated/animated_align_page.dart';
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
      },
    );
  }
}

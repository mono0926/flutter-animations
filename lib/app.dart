import 'package:animations/pages/animated/animated_align_page.dart';
import 'package:animations/pages/animated/animated_page.dart';
import 'package:animations/pages/home/home_page.dart';
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
        AnimatedPage.routeName: (_context) => AnimatedPage(),
        AnimatedAlignPage.routeName: (_context) => AnimatedAlignPage(),
      },
    );
  }
}

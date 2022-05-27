import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  static const routeName = 'animatedPositioned';

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  var _shrinked = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedPositioned',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _shrinked = !_shrinked;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: Stack(
          children: [
            Image.asset('assets/love_gray.png'),
            // nullと数値指定の変化のアニメーションには非対応なので注意
            AnimatedPositioned(
              top: 0,
              left: 0,
              width: _shrinked ? 50 : 300,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Image.asset('assets/love.png'),
            ),
          ],
        ),
      ),
    );
  }
}

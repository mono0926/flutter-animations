import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedDirectionalPage extends StatefulWidget {
  const AnimatedPositionedDirectionalPage({super.key});

  static const routeName = 'animatedPositionedDirectional';

  @override
  State<AnimatedPositionedDirectionalPage> createState() =>
      _AnimatedPositionedDirectionalPageState();
}

class _AnimatedPositionedDirectionalPageState
    extends State<AnimatedPositionedDirectionalPage> {
  var _shrinked = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedPositionedDirectional',
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
            Directionality(
              textDirection: TextDirection.rtl,
              child: AnimatedPositionedDirectional(
                top: 0,
                start: 0,
                width: _shrinked ? 50 : 300,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Image.asset('assets/love.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

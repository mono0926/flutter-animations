import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
class AnimatedCrossFadePage extends StatefulWidget {
  static const routeName = 'animatedCrossFade';

  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  var _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedCrossFade',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFirst = !_showFirst;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset('assets/love.png'),
          secondChild: Image.asset('assets/love_gray.png'),
          duration: const Duration(milliseconds: 500),
          crossFadeState:
              _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

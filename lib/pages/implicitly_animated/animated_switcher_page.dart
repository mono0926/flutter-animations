import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
/// See: https://medium.com/flutter-community/what-do-you-know-about-aniamtedswitcher-53cc3a4bebb8
class AnimatedSwitcherPage extends StatefulWidget {
  static const routeName = 'animatedSwitcher';

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  var _isDefaultImage = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedSwitcher',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isDefaultImage = !_isDefaultImage;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            'assets/love${_isDefaultImage ? '' : '_gray'}.png',
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }
}

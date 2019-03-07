import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
/// See: https://medium.com/flutter-community/flutter-working-with-animatedsize-35253ff8f16a
class AnimatedSizePage extends StatefulWidget {
  static const routeName = 'animatedSize';

  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
    with SingleTickerProviderStateMixin {
  var _isSmall = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedSize',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isSmall = !_isSmall;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            width: _isSmall ? 100 : 200,
            height: _isSmall ? 100 : 200,
            child: Image.asset('assets/love.png'),
          ),
        ),
      ),
    );
  }
}

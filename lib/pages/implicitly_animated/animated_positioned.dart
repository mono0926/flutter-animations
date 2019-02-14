import 'package:animations/widget/animation_object.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  static const routeName = 'animatedPositioned';

  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  double get _right {
    if (_alignment == Alignment.topLeft) {
      return null; // ignore: avoid_returning_null
    }
    if (_alignment == Alignment.topRight) {
      return 0;
    }
    if (_alignment == Alignment.bottomRight) {
      return 0;
    }
    if (_alignment == Alignment.bottomLeft) {
      return null; // ignore: avoid_returning_null
    }
    assert(false);
    return null; // ignore: avoid_returning_null
  }

  double get _bottom {
    if (_alignment == Alignment.topLeft) {
      return null; // ignore: avoid_returning_null
    }
    if (_alignment == Alignment.topRight) {
      return null; // ignore: avoid_returning_null
    }
    if (_alignment == Alignment.bottomRight) {
      return 0;
    }
    if (_alignment == Alignment.bottomLeft) {
      return 0;
    }
    assert(false);
    return null; // ignore: avoid_returning_null
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedPositioned',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: Stack(
          children: [
            Image.asset('assets/love_gray.png'),
            // TODO: なぜかアニメーションがされない
            AnimatedPositioned(
              right: _right,
              bottom: _bottom,
              duration: const Duration(milliseconds: 500),
              child: AnimationObject(),
              curve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}

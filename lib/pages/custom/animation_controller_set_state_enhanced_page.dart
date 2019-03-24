import 'package:animations/pages/custom/widget/ghost_fade_tween.dart';
import 'package:animations/pages/custom/widget/switch_string_tween.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimationControllerSetStateEnhancedPage extends StatefulWidget {
  static const routeName = 'AnimationControllerSetStateEnhanced';

  @override
  _AnimationControllerSetStateEnhancedPageState createState() =>
      _AnimationControllerSetStateEnhancedPageState();
}

class _AnimationControllerSetStateEnhancedPageState
    extends State<AnimationControllerSetStateEnhancedPage>
    with SingleTickerProviderStateMixin {
  static const _texts = [
    'First',
    'Second',
    'Third',
  ];
  static const _colors = [
    Colors.black,
    Colors.blue,
    Colors.red,
  ];
  var _index = 0;
  String get _currentText => _texts[_index % 3];
  Color get _currentColor => _colors[_index % 3];

  AnimationController _animation;
  GhostFadeTween _colorTween;
  SwitchStringTween _stringTween;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() => {});
      });
    _colorTween = GhostFadeTween(end: _currentColor);
    _stringTween = SwitchStringTween(
      begin: _currentText,
      end: _currentText,
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimationController - SetState (Enhanced)',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
            _colorTween = GhostFadeTween(
              begin: _colorTween.end,
              end: _currentColor,
            );
            _stringTween = SwitchStringTween(
              begin: _stringTween.end,
              end: _currentText,
            );
          });
          _animation.forward(from: 0);
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: Text(
          _stringTween.evaluate(_animation),
          style: Theme.of(context).textTheme.title.copyWith(
                color: _colorTween.evaluate(_animation),
              ),
        ),
      ),
    );
  }
}

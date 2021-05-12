import 'package:animations_app/pages/custom/widget/ghost_fade_tween.dart';
import 'package:animations_app/pages/custom/widget/switch_string_tween.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  static const routeName = 'AnimatedBuilderPage';

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
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

  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );
  late GhostFadeTween _colorTween = GhostFadeTween(
    begin: _currentColor,
    end: _currentColor,
  );
  late SwitchStringTween _stringTween = SwitchStringTween(
    begin: _currentText,
    end: _currentText,
  );

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedBuilder',
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
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _child) {
            // 一般的にchildは利用するべきだが今回は不要
            return Text(
              _stringTween.evaluate(_animation),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: _colorTween.evaluate(_animation)),
            );
          },
        ),
      ),
    );
  }
}

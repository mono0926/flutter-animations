import 'package:animations_app/pages/custom/widget/ghost_fade_tween.dart';
import 'package:animations_app/pages/custom/widget/switch_string_tween.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimationControllerSetStateEnhanced2Page extends StatefulWidget {
  const AnimationControllerSetStateEnhanced2Page({super.key});

  static const routeName = 'AnimationControllerSetStateEnhanced2';

  @override
  State<AnimationControllerSetStateEnhanced2Page> createState() =>
      _AnimationControllerSetStateEnhanced2PageState();
}

class _AnimationControllerSetStateEnhanced2PageState
    extends State<AnimationControllerSetStateEnhanced2Page>
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

  late GhostFadeTween _colorTween = GhostFadeTween(
    begin: _currentColor,
    end: _currentColor,
  );
  late SwitchStringTween _stringTween = SwitchStringTween(
    begin: _currentText,
    end: _currentText,
  );

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
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: _MyAnimatedWidget(
          stringTween: _stringTween,
          colorTween: _colorTween,
        ),
      ),
    );
  }
}

class _MyAnimatedWidget extends StatefulWidget {
  const _MyAnimatedWidget({
    required this.stringTween,
    required this.colorTween,
  });

  final SwitchStringTween stringTween;
  final GhostFadeTween colorTween;

  @override
  State<_MyAnimatedWidget> createState() => __MyAnimatedWidgetState();
}

class __MyAnimatedWidgetState extends State<_MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_MyAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.colorTween != widget.colorTween &&
        oldWidget.stringTween != widget.stringTween) {
      _animation.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.stringTween.evaluate(_animation),
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: widget.colorTween.evaluate(_animation),
          ),
    );
  }
}

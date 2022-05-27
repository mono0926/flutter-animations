import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimationControllerSetStatePage extends StatefulWidget {
  const AnimationControllerSetStatePage({super.key});

  static const routeName = 'AnimationControllerSetState';

  @override
  State<AnimationControllerSetStatePage> createState() =>
      _AnimationControllerSetStatePageState();
}

class _AnimationControllerSetStatePageState
    extends State<AnimationControllerSetStatePage>
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
  )..addListener(() {
      setState(() {});
    });
  late ColorTween _colorTween = ColorTween(end: _currentColor);

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimationController - SetState',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
            _colorTween = ColorTween(
              begin: _colorTween.end,
              end: _currentColor,
            );
          });
          _animation.forward(from: 0);
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: Text(
          _currentText,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: _colorTween.evaluate(_animation),
              ),
        ),
      ),
    );
  }
}

import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcher2Page extends StatefulWidget {
  const AnimatedSwitcher2Page({super.key});

  static const routeName = 'AnimatedSwitcher2Page';

  @override
  State<AnimatedSwitcher2Page> createState() => _AnimatedSwitcher2PageState();
}

class _AnimatedSwitcher2PageState extends State<AnimatedSwitcher2Page> {
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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedSwitcher',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity:
                  animation.drive(CurveTween(curve: const Interval(0.5, 1))),
              child: child,
            );
          },
          child: Text(
            _currentText,
            key: ValueKey(_currentText),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: _currentColor),
          ),
        ),
      ),
    );
  }
}

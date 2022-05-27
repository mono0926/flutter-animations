import 'package:animations_app/pages/custom/widget/ghost_fade_tween.dart';
import 'package:animations_app/pages/custom/widget/switch_string_tween.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({super.key});

  static const routeName = 'AnimatedWidgetPage';

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
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
      title: 'AnimatedWidget',
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
        child: _TextStyleColorTransition(
          animation: _animation.drive(_colorTween),
          style: Theme.of(context).textTheme.headline6!,
          child: _StringTransition(animation: _animation.drive(_stringTween)),
        ),
      ),
    );
  }
}

class _TextStyleColorTransition extends AnimatedWidget {
  const _TextStyleColorTransition({
    required this.child,
    required this.style,
    required Animation<Color> animation,
  }) : super(
          listenable: animation,
        );

  final Widget child;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Color>;
    return DefaultTextStyle(
      style: style.copyWith(color: animation.value),
      child: child,
    );
  }
}

class _StringTransition extends AnimatedWidget {
  const _StringTransition({
    required Animation<String> animation,
  }) : super(
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<String>;
    return Text(animation.value);
  }
}

import 'package:animations/pages/custom/widget/ghost_fade_tween.dart';
import 'package:animations/pages/custom/widget/switch_string_tween.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class ImplicitlyAnimatedWidgetPage extends StatefulWidget {
  static const routeName = 'ImplicitlyAnimatedWidgetPage';

  @override
  _ImplicitlyAnimatedWidgetPageState createState() =>
      _ImplicitlyAnimatedWidgetPageState();
}

class _ImplicitlyAnimatedWidgetPageState
    extends State<ImplicitlyAnimatedWidgetPage> {
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
      title: 'ImplicitlyAnimatedWidget',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: Headline(
          targetColor: _currentColor,
          targetString: _currentText,
        ),
      ),
    );
  }
}

class Headline extends ImplicitlyAnimatedWidget {
  const Headline({
    Key key,
    @required this.targetColor,
    @required this.targetString,
  }) : super(
          key: key,
          duration: const Duration(milliseconds: 1000),
        );

  final Color targetColor;
  final String targetString;

  @override
  _HeadlineState createState() => _HeadlineState();
}

class _HeadlineState extends AnimatedWidgetBaseState<Headline> {
  GhostFadeTween _colorTween;
  SwitchStringTween _stringTween;

  @override
  Widget build(BuildContext context) {
    return Text(
      _stringTween.evaluate(animation),
      style: Theme.of(context)
          .textTheme
          .title
          .copyWith(color: _colorTween.evaluate(animation)),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.targetColor,
      (color) => GhostFadeTween(begin: color as Color),
    ) as GhostFadeTween;

    _stringTween = visitor(
      _stringTween,
      widget.targetString,
      (string) => SwitchStringTween(begin: string as String),
    ) as SwitchStringTween;
  }
}

import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({super.key});

  static const routeName = 'TweenAnimationBuilderPage';

  @override
  State<TweenAnimationBuilderPage> createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
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
  ColoredLabel get _coloredLabel => ColoredLabel(
        label: _texts[_index % 3],
        color: _colors[_index % 3],
      );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'TweenAnimationBuilder',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: TweenAnimationBuilder<ColoredLabel>(
          tween: ColoredLabelTween(begin: _coloredLabel, end: _coloredLabel),
          duration: const Duration(milliseconds: 1000),
          builder: (context, coloredLabel, child) {
            return Text(
              coloredLabel.label,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: coloredLabel.color),
            );
          },
        ),
      ),
    );
  }
}

class ColoredLabelTween extends Tween<ColoredLabel> {
  ColoredLabelTween({
    super.begin,
    super.end,
  });
  final _middleColor = Colors.transparent;

  @override
  ColoredLabel lerp(double t) => ColoredLabel(
        label: t < 0.5 ? begin!.label : end!.label,
        color: t < 0.5
            ? Color.lerp(begin!.color, _middleColor, t * 2)!
            : Color.lerp(_middleColor, end!.color, (t - 0.5) * 2)!,
      );
}

class ColoredLabel {
  ColoredLabel({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  int get hashCode => Object.hash(label, color);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColoredLabel &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          color == other.color;
}

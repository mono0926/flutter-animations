import 'package:flutter/material.dart';

class GhostFadeTween extends Tween<Color> {
  GhostFadeTween({
    super.begin,
    super.end,
  });
  final middle = Colors.transparent;

  @override
  Color lerp(double t) {
    return t < 0.5
        ? Color.lerp(begin, middle, t * 2)!
        : Color.lerp(middle, end, (t - 0.5) * 2)!;
  }
}

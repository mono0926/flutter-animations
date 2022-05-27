import 'package:flutter/material.dart';

class GhostFadeTween extends Tween<Color> {
  GhostFadeTween({
    super.begin,
    super.end,
  });
  final middle = Colors.white;

  @override
  Color lerp(double t) {
    if (t < 0.5) {
      return Color.lerp(begin, middle, t * 2)!;
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2)!;
    }
  }
}

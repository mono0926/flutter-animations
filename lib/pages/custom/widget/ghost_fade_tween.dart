import 'package:flutter/material.dart';

class GhostFadeTween extends Tween<Color> {
  GhostFadeTween({
    Color begin,
    Color end,
  }) : super(
          begin: begin,
          end: end,
        );
  final middle = Colors.white;

  @override
  Color lerp(double t) {
    if (t < 0.5) {
      return Color.lerp(begin, middle, t * 2);
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2);
    }
  }
}

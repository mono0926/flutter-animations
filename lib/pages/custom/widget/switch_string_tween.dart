import 'package:flutter/material.dart';

class SwitchStringTween extends Tween<String> {
  SwitchStringTween({
    super.begin,
    super.end,
  });

  @override
  String lerp(double t) => t < 0.5 ? begin! : end!;
}

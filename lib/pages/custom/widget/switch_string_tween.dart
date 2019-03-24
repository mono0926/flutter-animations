import 'package:flutter/material.dart';

class SwitchStringTween extends Tween<String> {
  SwitchStringTween({
    String begin,
    String end,
  }) : super(begin: begin, end: end);

  @override
  String lerp(double t) => t < 0.5 ? begin : end;
}

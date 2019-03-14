import 'package:flutter/material.dart';

// TODO: Transition?
class AnimatedDot extends AnimatedWidget {
  final Color color;

  const AnimatedDot({
    Key key,
    @required Animation<double> animation,
    @required this.color,
  }) : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final animation = super.listenable as Animation<double>;
    return Positioned(
      top: animation.value,
      child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFDDDDDD),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          )),
    );
  }
}

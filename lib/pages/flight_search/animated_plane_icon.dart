import 'package:flutter/material.dart';

class AnimatedPlaneIcon extends StatelessWidget {
  const AnimatedPlaneIcon({
    super.key,
    required this.size,
    required this.scaleAnimation,
  });

  final double size;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomCenter,
      scale: scaleAnimation,
      child: Icon(
        Icons.airplanemode_active,
        color: Theme.of(context).primaryColor,
        size: 36,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedPlaneIcon extends StatelessWidget {
  const AnimatedPlaneIcon({
    Key key,
    @required this.size,
    @required this.scaleAnimation,
  }) : super(key: key);

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

import 'package:animations/pages/flight_search/animated_plane_icon.dart';
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _planeSizeAnimation;

  static const double _initialPlanePaddingBottom = 16;
  static const double _planeSize = 60;

  double get _planeTopPadding =>
      widget.height - (_initialPlanePaddingBottom + _planeSize);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 340),
    );
    _planeSizeAnimation = _animationController.drive(
      Tween<double>(
        begin: 60,
        end: 36,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [_buildPlane()],
    );
  }

  Widget _buildPlane() {
    return Positioned(
      top: _planeTopPadding,
      child: Column(
        children: [
          AnimatedPlaneIcon(animation: _planeSizeAnimation),
        ],
      ),
    );
  }
}

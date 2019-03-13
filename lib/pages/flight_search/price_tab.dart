import 'package:animations/pages/flight_search/animated_plane_icon.dart';
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({
    Key key,
  }) : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _planeScaleAnimation;

  static const double _initialPlanePaddingBottom = 16;
  static const double _planeSize = 36;

  // double get _planeTopPadding =>
  //     widget.height - (_initialPlanePaddingBottom + _planeSize);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 340),
    );
    _planeScaleAnimation = _animationController
        .drive(
          CurveTween(curve: Curves.easeOut),
        )
        .drive(
          Tween<double>(
            begin: 5 / 3,
            end: 1,
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
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [_buildPlane(constraints: constraints)],
          ),
    );
  }

  Widget _buildPlane({
    @required BoxConstraints constraints,
  }) {
    return Positioned(
      top: constraints.maxHeight - (_initialPlanePaddingBottom + _planeSize),
      child: Column(
        children: [
          AnimatedPlaneIcon(
            size: _planeSize,
            scaleAnimation: _planeScaleAnimation,
          ),
        ],
      ),
    );
  }
}

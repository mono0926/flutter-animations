import 'package:animations/pages/flight_search/animated_plane_icon.dart';
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({
    Key key,
  }) : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  AnimationController _planeSizeAnimationController;
  AnimationController _planeTravelController;
  Animation<double> _planeScaleAnimation;

  static const double _initialPlanePaddingBottom = 16;
  static const double _planeSize = 36;

  @override
  void initState() {
    super.initState();
    _planeSizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 340),
    );
    _planeScaleAnimation = _planeSizeAnimationController
        .drive(
          CurveTween(curve: Curves.easeOut),
        )
        .drive(
          Tween<double>(
            begin: 5 / 3,
            end: 1,
          ),
        );

    _planeTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _forwardAnimation();
  }

  void _forwardAnimation() async {
    await _planeSizeAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    await _planeTravelController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeTravelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [
              _buildPlane(constraints: constraints),
            ],
          ),
    );
  }

  Widget _buildPlane({
    @required BoxConstraints constraints,
  }) {
    final beginTop =
        constraints.maxHeight - (_initialPlanePaddingBottom + _planeSize);
    const endTop = 16.0;
    return PositionedTransition(
      rect: _planeTravelController
          .drive(CurveTween(curve: Curves.fastOutSlowIn))
          .drive(RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, beginTop, 0, -beginTop),
            end: const RelativeRect.fromLTRB(0, endTop, 0, endTop),
          )),
      child: Column(
        children: [
          AnimatedPlaneIcon(
            size: _planeSize,
            scaleAnimation: _planeScaleAnimation,
          ),
          Container(
            width: 2,
            height: 240,
            color: const Color.fromARGB(255, 200, 200, 200),
          )
        ],
      ),
    );
  }
}

import 'package:animations/pages/flight_search/animated_dot.dart';
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
  AnimationController _dotsAnimationController;
  Animation<double> _planeScaleAnimation;

  static const double _initialPlanePaddingBottom = 16;
  static const double _minPlanePaddingTop = 16;
  static const double _planeSize = 36;
  static const double _cardHeight = 80;
  static const _flightStops = [1, 2, 3, 4];

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

    _dotsAnimationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _forwardAnimation();
  }

  void _forwardAnimation() async {
    await _planeSizeAnimationController.forward();
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 500))
        .then((_) => _planeTravelController.forward());
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 700))
        .then((_) => _dotsAnimationController.forward());
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [
              _buildPlane(constraints: constraints),
            ]..addAll(
                _flightStops.map(
                  (stop) => _mapFlightStopToDot(
                        stop: stop,
                        constraints: constraints,
                      ),
                ),
              ),
          ),
    );
  }

  Widget _buildPlane({
    @required BoxConstraints constraints,
  }) {
    final beginTop =
        constraints.maxHeight - (_initialPlanePaddingBottom + _planeSize);
    final planeTravelAnimation = _planeTravelController
        .drive(CurveTween(curve: Curves.fastOutSlowIn))
        .drive(Tween<double>(
          begin: beginTop,
          end: _minPlanePaddingTop,
        ));
    return AnimatedBuilder(
      animation: planeTravelAnimation,
      builder: (context, child) => Positioned(
            child: child,
            top: planeTravelAnimation.value,
          ),
      child: Column(
        children: [
          AnimatedPlaneIcon(
            size: _planeSize,
            scaleAnimation: _planeScaleAnimation,
          ),
          Container(
            width: 2,
            height: _flightStops.length * _cardHeight * 0.8,
            color: const Color.fromARGB(255, 200, 200, 200),
          )
        ],
      ),
    );
  }

  Widget _mapFlightStopToDot({
    @required BoxConstraints constraints,
    @required int stop,
  }) {
    final index = _flightStops.indexOf(stop);
    final start = 0.2 * index;
    final minMarginTop = _minPlanePaddingTop + _planeSize + (0.8 * _cardHeight);
    final finalMarginTop = index * (0.8 * _cardHeight) + minMarginTop;
    final animation = _dotsAnimationController
        .drive(
          CurveTween(
            curve: Interval(
              start,
              start + 0.4,
              curve: Curves.easeOut,
            ),
          ),
        )
        .drive(
          Tween<double>(
            begin: constraints.maxHeight,
            end: finalMarginTop,
          ),
        );

    final isStartOrEnd = index == 0 || index == _flightStops.length - 1;
    final color = isStartOrEnd ? Colors.red : Colors.green;
    return AnimatedDot(
      animation: animation,
      color: color,
    );
  }
}

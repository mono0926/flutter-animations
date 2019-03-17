import 'package:animations/pages/flight_search/animated_dot.dart';
import 'package:animations/pages/flight_search/animated_plane_icon.dart';
import 'package:animations/pages/flight_search/flight_stop.dart';
import 'package:animations/pages/flight_search/flight_stop_card.dart';
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({
    Key key,
    @required this.onCompleted,
  }) : super(key: key);

  final void Function() onCompleted;

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  AnimationController _planeSizeController;
  AnimationController _planeTravelController;
  AnimationController _dotsAnimationController;
  Animation<double> _planeScaleAnimation;

  static const double _initialPlanePaddingBottom = 16;
  static const double _minPlanePaddingTop = 16;
  static const double _planeSize = 36;
  static const double _cardHeight = 80;
  static const _flightStops = [
    FlightStop(
      from: 'JFK',
      to: 'ORY',
      date: 'JUN 05',
      duration: '6h 25m',
      price: '\$851',
      fromToTime: '9:26 am - 3:43 pm',
    ),
    FlightStop(
      from: 'MRG',
      to: 'FTB',
      date: 'JUN 20',
      duration: '6h 25m',
      price: '\$532',
      fromToTime: '9:26 am - 3:43 pm',
    ),
    FlightStop(
      from: 'ERT',
      to: 'TVS',
      date: 'JUN 20',
      duration: '6h 25m',
      price: '\$718',
      fromToTime: '9:26 am - 3:43 pm',
    ),
    FlightStop(
      from: 'KKR',
      to: 'RTY',
      date: 'JUN 20',
      duration: '6h 25m',
      price: '\$663',
      fromToTime: '9:26 am - 3:43 pm',
    ),
  ];
  final _stopKeys =
      _flightStops.map((_s) => GlobalKey<FlightStopCardState>()).toList();

  @override
  void initState() {
    super.initState();
    _planeSizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 340),
    );
    _planeScaleAnimation = _planeSizeController
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

    _dotsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _forwardAnimation();
  }

  void _forwardAnimation() async {
    await _planeSizeController.forward();
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 500))
        .then((_) => _planeTravelController.forward());
    // ignore: unawaited_futures
    Future.delayed(const Duration(milliseconds: 700)).then((_) async {
      await _dotsAnimationController.forward();
      await _animateFlightStopCards();
    });
  }

  Future _animateFlightStopCards() async {
    for (final stopKey in _stopKeys) {
      await Future.delayed(const Duration(milliseconds: 250));
      stopKey.currentState?.runAnimation();
    }
    await Future.delayed(const Duration(milliseconds: 100));
    widget.onCompleted();
  }

  @override
  void dispose() {
    _planeSizeController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final flightStopTweenMap = _flightStops.asMap().map((index, stop) {
          final minMarginTop =
              _minPlanePaddingTop + _planeSize + (0.8 * _cardHeight);
          final finalMarginTop = index * (0.8 * _cardHeight) + minMarginTop;
          return MapEntry(
            stop,
            Tween<double>(
              begin: constraints.maxHeight,
              end: finalMarginTop,
            ),
          );
        });
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildPlane(constraints: constraints),
          ]
            ..addAll(
              _flightStops.map(
                (stop) => _buildStopCard(
                      stop: stop,
                      tween: flightStopTweenMap[stop],
                    ),
              ),
            )
            ..addAll(
              _flightStops.map(
                (stop) => _mapFlightStopToDot(
                      stop: stop,
                      tween: flightStopTweenMap[stop],
                    ),
              ),
            ),
        );
      },
    );
  }

  Widget _buildPlane({
    @required BoxConstraints constraints,
  }) {
    final beginTop =
        constraints.maxHeight - (_initialPlanePaddingBottom + _planeSize);
    final planeTravelAnimation = _planeTravelController
        .drive(CurveTween(curve: Curves.fastOutSlowIn))
        .drive(
          Tween<double>(
            begin: beginTop,
            end: _minPlanePaddingTop,
          ),
        );
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
    @required FlightStop stop,
    @required Tween<double> tween,
  }) {
    final index = _flightStops.indexOf(stop);
    final start = 0.2 * _flightStops.indexOf(stop);
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
        .drive(tween);

    final isStartOrEnd = index == 0 || index == _flightStops.length - 1;
    final color = isStartOrEnd ? Theme.of(context).primaryColor : Colors.green;
    return AnimatedDot(
      animation: animation,
      color: color,
    );
  }

  Widget _buildStopCard({
    @required FlightStop stop,
    @required Tween<double> tween,
  }) {
    final index = _flightStops.indexOf(stop);
    final topMargin =
        tween.end - 0.5 * (FlightStopCard.height - AnimatedDot.size);
    final isLeft = index.isOdd;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLeft ? Container() : Expanded(child: Container()),
            Expanded(
              child: FlightStopCard(
                key: _stopKeys[index],
                flightStop: stop,
                isLeft: isLeft,
              ),
            ),
            !isLeft ? Container() : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

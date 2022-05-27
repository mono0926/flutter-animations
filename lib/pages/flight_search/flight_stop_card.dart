import 'package:animations_app/pages/flight_search/flight_stop.dart';
import 'package:flutter/material.dart';

// DefaultTextStyleTransitionで分けているのはやり過ぎかも
class FlightStopCard extends StatefulWidget {
  const FlightStopCard({
    required Key key,
    required this.flightStop,
    required this.isLeft,
  }) : super(key: key);

  final FlightStop flightStop;
  final bool isLeft;

  static const double height = 80;
  static const double width = 140;

  @override
  FlightStopCardState createState() => FlightStopCardState();
}

class FlightStopCardState extends State<FlightStopCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );
  late final Animation<double> _cardSizeAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0, 0.9, curve: ElasticOutCurve(0.8)),
  ),);
  late final Animation<double> _durationPositionAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0.05, 0.95, curve: ElasticOutCurve(0.95)),
  ),);
  late final Animation<double> _airportsPositionAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0.1, 1, curve: ElasticOutCurve(0.95)),
  ),);
  late final Animation<double> _datePositionAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0.1, 0.8, curve: ElasticOutCurve(0.95)),
  ),);
  late final Animation<double> _pricePositionAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0, 0.9, curve: ElasticOutCurve(0.95)),
  ),);
  late final Animation<double> _fromToPositionAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0.1, 0.95, curve: ElasticOutCurve(0.95)),
  ),);
  late final Animation<double> _lineAnimation =
      _animationController.drive(CurveTween(
    curve: const Interval(0, 0.2),
  ),);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  TickerFuture runAnimation() {
    return _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FlightStopCard.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              _buildLine(maxWidth: maxWidth),
              _buildCard(maxWidth: maxWidth),
              _buildDurationText(maxWidth: maxWidth),
              _buildAirportNamesText(maxWidth: maxWidth),
              _buildDateText(maxWidth: maxWidth),
              _buildPriceText(maxWidth: maxWidth),
              _buildFromToTimeText(maxWidth: maxWidth),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLine({
    required double maxWidth,
  }) {
    final maxLength = maxWidth - FlightStopCard.width;
    return Align(
      alignment: widget.isLeft ? Alignment.centerRight : Alignment.centerLeft,
      child: AnimatedBuilder(
        animation: _lineAnimation,
        builder: (context, child) => Container(
          height: 2,
          width: maxLength * _lineAnimation.value,
          color: const Color.fromARGB(255, 200, 200, 200),
        ),
      ),
    );
  }

  Widget _buildCard({
    required double maxWidth,
  }) {
    const minOuterMargin = 8.0;
    return AnimatedBuilder(
      animation: _cardSizeAnimation,
      builder: (context, child) {
        final outerMargin =
            minOuterMargin + (1 - _cardSizeAnimation.value) * maxWidth;
        return Positioned(
          right: widget.isLeft ? null : outerMargin,
          left: widget.isLeft ? outerMargin : null,
          child: child!,
        );
      },
      child: ScaleTransition(
        scale: _cardSizeAnimation,
        child: SizedBox(
          width: 140,
          height: 80,
          child: Card(
            color: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }

  Widget _buildDurationText({
    required double maxWidth,
  }) {
    return AnimatedBuilder(
      animation: _durationPositionAnimation,
      builder: (context, child) => Positioned(
        top: _getMarginTop(_durationPositionAnimation.value),
        right: _getMarginRight(_durationPositionAnimation.value,
            maxWidth: maxWidth,),
        child: child!,
      ),
      child: DefaultTextStyleTransition(
        style: _durationPositionAnimation.drive(
          TextStyleTween(
            begin: const TextStyle(fontSize: 0),
            end: const TextStyle(fontSize: 10),
          ),
        ),
        child: Text(
          widget.flightStop.duration,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildAirportNamesText({
    required double maxWidth,
  }) {
    return AnimatedBuilder(
      animation: _airportsPositionAnimation,
      builder: (context, child) => Positioned(
        top: _getMarginTop(_airportsPositionAnimation.value),
        left: _getMarginLeft(_airportsPositionAnimation.value,
            maxWidth: maxWidth,),
        child: child!,
      ),
      child: DefaultTextStyleTransition(
        style: _airportsPositionAnimation.drive(
          TextStyleTween(
            begin: const TextStyle(fontSize: 0),
            end: const TextStyle(fontSize: 14),
          ),
        ),
        child: Text(
          '${widget.flightStop.from} \u00B7 ${widget.flightStop.to}',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildDateText({
    required double maxWidth,
  }) {
    return AnimatedBuilder(
      animation: _datePositionAnimation,
      builder: (context, child) => Positioned(
        left: _getMarginLeft(
          _datePositionAnimation.value,
          maxWidth: maxWidth,
        ),
        child: child!,
      ),
      child: DefaultTextStyleTransition(
        style: _airportsPositionAnimation.drive(
          TextStyleTween(
            begin: const TextStyle(fontSize: 0),
            end: const TextStyle(fontSize: 14),
          ),
        ),
        child: Text(
          widget.flightStop.date,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildPriceText({
    required double maxWidth,
  }) {
    return AnimatedBuilder(
      animation: _pricePositionAnimation,
      builder: (context, child) => Positioned(
        right: _getMarginRight(
          _pricePositionAnimation.value,
          maxWidth: maxWidth,
        ),
        child: child!,
      ),
      child: DefaultTextStyleTransition(
        style: _airportsPositionAnimation.drive(
          TextStyleTween(
            begin: const TextStyle(fontSize: 0),
            end: const TextStyle(fontSize: 16),
          ),
        ),
        child: Text(
          widget.flightStop.price,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFromToTimeText({
    required double maxWidth,
  }) {
    return AnimatedBuilder(
      animation: _fromToPositionAnimation,
      builder: (context, child) => Positioned(
        left: _getMarginLeft(
          _fromToPositionAnimation.value,
          maxWidth: maxWidth,
        ),
        bottom: _getMarginBottom(_fromToPositionAnimation.value),
        child: child!,
      ),
      child: DefaultTextStyleTransition(
        style: _airportsPositionAnimation.drive(
          TextStyleTween(
            begin: const TextStyle(fontSize: 0),
            end: const TextStyle(fontSize: 12),
          ),
        ),
        child: Text(
          widget.flightStop.fromToTime,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  double _getMarginBottom(double animationValue) {
    const minBottomMargin = 8.0;
    final bottomMargin =
        minBottomMargin + (1 - animationValue) * minBottomMargin;
    return bottomMargin;
  }

  double _getMarginTop(double animationValue) {
    const minMarginTop = 8.0;
    final marginTop =
        minMarginTop + (1 - animationValue) * FlightStopCard.height * 0.5;
    return marginTop;
  }

  double _getMarginLeft(
    double animationValue, {
    required double maxWidth,
  }) {
    return _getMarginHorizontal(
      animationValue,
      isTextLeft: true,
      maxWidth: maxWidth,
    );
  }

  double _getMarginRight(
    double animationValue, {
    required double maxWidth,
  }) {
    return _getMarginHorizontal(
      animationValue,
      isTextLeft: false,
      maxWidth: maxWidth,
    );
  }

  double _getMarginHorizontal(
    double animationValue, {
    required bool isTextLeft,
    required double maxWidth,
  }) {
    if (isTextLeft == widget.isLeft) {
      const minHorizontalMargin = 16.0;
      final maxHorizontalMargin = maxWidth - minHorizontalMargin;
      final horizontalMargin =
          minHorizontalMargin + (1 - animationValue) * maxHorizontalMargin;
      return horizontalMargin;
    } else {
      final maxHorizontalMargin = maxWidth - FlightStopCard.width;
      final horizontalMargin = animationValue * maxHorizontalMargin;
      return horizontalMargin;
    }
  }
}

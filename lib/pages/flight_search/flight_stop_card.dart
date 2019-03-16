import 'package:animations/pages/flight_search/flight_stop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlightStopCard extends StatefulWidget {
  const FlightStopCard({
    @required Key key,
    @required this.flightStop,
    @required this.isLeft,
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
  AnimationController _animationController;
  Animation<double> _cardSizeAnimation;
  Animation<double> _durationPositionAnimation;
  Animation<double> _airportsPositionAnimation;
  Animation<double> _datePositionAnimation;
  Animation<double> _pricePositionAnimation;
  Animation<double> _fromToPositionAnimation;
  Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _cardSizeAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0, 0.9, curve: ElasticOutCurve(0.8)),
    ));
    _durationPositionAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0.05, 0.95, curve: ElasticOutCurve(0.95)),
    ));
    _airportsPositionAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0.1, 1, curve: ElasticOutCurve(0.95)),
    ));
    _datePositionAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0.1, 0.8, curve: ElasticOutCurve(0.95)),
    ));
    _pricePositionAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0, 0.9, curve: ElasticOutCurve(0.95)),
    ));
    _fromToPositionAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0.1, 0.95, curve: ElasticOutCurve(0.95)),
    ));
    _lineAnimation = _animationController.drive(CurveTween(
      curve: const Interval(0, 0.2, curve: Curves.linear),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void runAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FlightStopCard.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                buildLine(),
                buildCard(),
                buildDurationText(),
                buildAirportNamesText(),
                buildDateText(),
                buildPriceText(),
                buildFromToTimeText(),
              ],
            ),
      ),
    );
  }

// TODO: LayoutBuilder
  double get maxWidth {
    final renderBox = context.findRenderObject() as RenderBox;
    final constraints = renderBox?.constraints;
    final maxWidth = constraints?.maxWidth ?? 0;
    return maxWidth;
  }

  Positioned buildDurationText() {
    final animationValue = _durationPositionAnimation.value;
    return Positioned(
      top: getMarginTop(animationValue), //<--- animate vertical position
      right: getMarginRight(animationValue), //<--- animate horizontal pozition
      child: Text(
        widget.flightStop.duration,
        style: TextStyle(
          fontSize: 10 * animationValue, //<--- animate fontsize
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildAirportNamesText() {
    final animationValue = _airportsPositionAnimation.value;
    return Positioned(
      top: getMarginTop(animationValue),
      left: getMarginLeft(animationValue),
      child: Text(
        '${widget.flightStop.from} \u00B7 ${widget.flightStop.to}',
        style: TextStyle(
          fontSize: 14 * animationValue,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildDateText() {
    final animationValue = _datePositionAnimation.value;
    return Positioned(
      left: getMarginLeft(animationValue),
      child: Text(
        '${widget.flightStop.date}',
        style: TextStyle(
          fontSize: 14 * animationValue,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildPriceText() {
    final animationValue = _pricePositionAnimation.value;
    return Positioned(
      right: getMarginRight(animationValue),
      child: Text(
        '${widget.flightStop.price}',
        style: TextStyle(
          fontSize: 16 * animationValue,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Positioned buildFromToTimeText() {
    final animationValue = _fromToPositionAnimation.value;
    return Positioned(
      left: getMarginLeft(animationValue),
      bottom: getMarginBottom(animationValue),
      child: Text(
        '${widget.flightStop.fromToTime}',
        style: TextStyle(
          fontSize: 12 * animationValue,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildLine() {
    final animationValue = _lineAnimation.value;
    final maxLength = maxWidth - FlightStopCard.width;
    return Align(
      alignment: widget.isLeft ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        height: 2,
        width: maxLength * animationValue,
        color: const Color.fromARGB(255, 200, 200, 200),
      ),
    );
  }

  Positioned buildCard() {
    final animationValue = _cardSizeAnimation.value;
    final minOuterMargin = 8;
    final outerMargin = minOuterMargin + (1 - animationValue) * maxWidth;
    return Positioned(
      right: widget.isLeft ? null : outerMargin,
      left: widget.isLeft ? outerMargin : null,
      child: Transform.scale(
        scale: animationValue,
        child: Container(
          width: 140,
          height: 80,
          child: Card(
            color: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }

  double getMarginBottom(double animationValue) {
    final minBottomMargin = 8.0;
    final bottomMargin =
        minBottomMargin + (1 - animationValue) * minBottomMargin;
    return bottomMargin;
  }

  double getMarginTop(double animationValue) {
    final minMarginTop = 8.0;
    final marginTop =
        minMarginTop + (1 - animationValue) * FlightStopCard.height * 0.5;
    return marginTop;
  }

  double getMarginLeft(double animationValue) {
    return getMarginHorizontal(animationValue, isTextLeft: true);
  }

  double getMarginRight(double animationValue) {
    return getMarginHorizontal(animationValue, isTextLeft: false);
  }

  double getMarginHorizontal(
    double animationValue, {
    @required bool isTextLeft,
  }) {
    if (isTextLeft == widget.isLeft) {
      final minHorizontalMargin = 16.0;
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

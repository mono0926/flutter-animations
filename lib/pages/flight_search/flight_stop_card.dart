import 'package:animations/pages/flight_search/flight_stop.dart';
import 'package:flutter/material.dart';

class FlightStopCard extends StatefulWidget {
  const FlightStopCard({
    Key key,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: FlightStopCard.height,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          buildLine(),
          buildCard(),
          buildDurationText(),
          buildAirportNamesText(),
          buildDateText(),
          buildPriceText(),
          buildFromToTimeText(),
        ],
      ),
    );
  }

  // TODO: LayoutBuilder使う？
  double get maxWidth {
    final renderBox = context.findRenderObject() as RenderBox;
    final constraints = renderBox?.constraints;
    final maxWidth = constraints?.maxWidth ?? 180;
    return maxWidth;
  }

  Positioned buildDurationText() {
    return Positioned(
      top: getMarginTop(),
      right: getMarginRight(),
      child: Text(
        widget.flightStop.duration,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildAirportNamesText() {
    return Positioned(
      top: getMarginTop(),
      left: getMarginLeft(),
      child: Text(
        '${widget.flightStop.from} \u00B7 ${widget.flightStop.to}',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildDateText() {
    return Positioned(
      left: getMarginLeft(),
      child: Text(
        '${widget.flightStop.date}',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildPriceText() {
    return Positioned(
      right: getMarginRight(),
      child: Text(
        '${widget.flightStop.price}',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Positioned buildFromToTimeText() {
    return Positioned(
      left: getMarginLeft(),
      bottom: getMarginBottom(),
      child: Text(
        '${widget.flightStop.fromToTime}',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildLine() {
    final maxLength = maxWidth - FlightStopCard.width;
    return Align(
      alignment: widget.isLeft ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        height: 2,
        width: maxLength,
        color: const Color.fromARGB(255, 200, 200, 200),
      ),
    );
  }

  Positioned buildCard() {
    final outerMargin = 8.0;
    return Positioned(
      right: widget.isLeft ? null : outerMargin,
      left: widget.isLeft ? outerMargin : null,
      child: Container(
        width: 140,
        height: 80,
        child: Card(
          color: Colors.grey.shade100,
        ),
      ),
    );
  }

  double getMarginBottom() {
    final minBottomMargin = 8.0;
    return minBottomMargin;
  }

  double getMarginTop() {
    final minMarginTop = 8.0;
    return minMarginTop;
  }

  double getMarginLeft() {
    return getMarginHorizontal(isTextLeft: true);
  }

  double getMarginRight() {
    return getMarginHorizontal(isTextLeft: false);
  }

  double getMarginHorizontal({@required bool isTextLeft}) {
    if (isTextLeft == widget.isLeft) {
      final minHorizontalMargin = 16.0;
      return minHorizontalMargin;
    } else {
      final maxHorizontalMargin = maxWidth - FlightStopCard.width;
      return maxHorizontalMargin;
    }
  }
}

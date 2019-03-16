import 'package:animations/pages/flight_search/flight_stop_ticker.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key key,
    this.stop,
  }) : super(key: key);

  final FlightStopTicket stop;
  static const airportNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const airportShortNameStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w200,
  );
  static const flightNumberStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(radius: 10),
      child: Material(
        elevation: 4,
        shadowColor: const Color(0x30E5E5E5),
        color: Colors.transparent,
        child: ClipPath(
          clipper: TicketClipper(radius: 12),
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.all(2),
            child: _buildCardContent(),
          ),
        ),
      ),
    );
  }

  Container _buildCardContent() {
    return Container(
      height: 104,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildFrom(),
          _buildFlightNumber(),
          _buildTo(),
        ],
      ),
    );
  }

  Column _buildFlightNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.red,
          ),
        ),
        Text(
          stop.flightNumber,
          style: flightNumberStyle,
        ),
      ],
    );
  }

  Expanded _buildFrom() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                stop.from,
                style: airportNameStyle,
              ),
            ),
            Text(
              stop.fromShort,
              style: airportShortNameStyle,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildTo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                stop.to,
                style: airportNameStyle,
              ),
            ),
            Text(
              stop.toShort,
              style: airportShortNameStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    @required this.radius,
  });

  final double radius;

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..addOval(Rect.fromCircle(
        center: Offset(0, size.height / 2),
        radius: radius,
      ))
      ..addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2),
        radius: radius,
      ));
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => oldClipper.radius != radius;
}

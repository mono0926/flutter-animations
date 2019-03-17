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
            child: _buildCardContent(context),
          ),
        ),
      ),
    );
  }

  Container _buildCardContent(BuildContext context) {
    return Container(
      height: 104,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: _buildLocation(
              name: stop.from,
              nameShort: stop.fromShort,
            ),
          ),
          _buildFlightNumber(context),
          Expanded(
            child: _buildLocation(
              name: stop.to,
              nameShort: stop.toShort,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            Icons.airplanemode_active,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          stop.flightNumber,
          style: flightNumberStyle,
        ),
      ],
    );
  }

  Widget _buildLocation({
    @required String name,
    @required String nameShort,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            name,
            style: airportNameStyle,
          ),
        ),
        Text(
          nameShort,
          style: airportShortNameStyle,
        ),
      ],
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

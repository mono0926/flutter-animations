import 'package:animations/pages/flight_search/flight_stop_ticker.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key key,
    this.stop,
  }) : super(key: key);

  final FlightStopTicket stop;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(2),
      child: _buildCardContent(),
    );
  }

  Container _buildCardContent() {
    final airportNameStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    final airportShortNameStyle = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w200,
    );
    final flightNumberStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 104,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
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
          ),
          Column(
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
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}

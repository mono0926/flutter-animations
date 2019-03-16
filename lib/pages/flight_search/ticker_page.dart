import 'package:animations/pages/flight_search/air_asia_bar.dart';
import 'package:animations/pages/flight_search/flight_stop_ticker.dart';
import 'package:animations/pages/flight_search/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>
    with TickerProviderStateMixin {
  static const stops = [
    FlightStopTicket(
      from: 'Sahara',
      fromShort: 'SHE',
      to: 'Macao',
      toShort: 'MAC',
      flightNumber: 'SE2341',
    ),
    FlightStopTicket(
      from: 'Macao',
      fromShort: 'MAC',
      to: 'Cape Verde',
      toShort: 'CAP',
      flightNumber: 'KU2342',
    ),
    FlightStopTicket(
      from: 'Cape Verde',
      fromShort: 'CAP',
      to: 'Ireland',
      toShort: 'IRE',
      flightNumber: 'KR3452',
    ),
    FlightStopTicket(
      from: 'Ireland',
      fromShort: 'IRE',
      to: 'Sahara',
      toShort: 'SHE',
      flightNumber: 'MR4321',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AirAsiaBar(height: 180),
          Positioned.fill(
            top: 64,
            child: ListView(
              children: _buildTickets().toList(),
            ),
          )
        ],
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Iterable<Widget> _buildTickets() {
    return stops.map((stop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TicketCard(stop: stop),
      );
    });
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
      child: const Icon(Icons.fingerprint),
    );
  }
}

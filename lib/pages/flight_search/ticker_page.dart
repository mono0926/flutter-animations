import 'package:animations/app.dart';
import 'package:animations/pages/flight_search/air_asia_bar.dart';
import 'package:animations/pages/flight_search/flight_stop_ticker.dart';
import 'package:animations/pages/flight_search/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>
    with SingleTickerProviderStateMixin {
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
  AnimationController _cardEntranceAnimationController;
  Map<FlightStopTicket, Animation<double>> _ticketAnimations;

  @override
  void initState() {
    super.initState();
    _cardEntranceAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    _ticketAnimations = stops.asMap().map((index, stop) {
      final start = index * 0.1;
      return MapEntry(
        stop,
        _cardEntranceAnimationController
            .drive(
              CurveTween(
                curve: Interval(
                  start,
                  start + 0.6,
                  curve: Curves.decelerate,
                ),
              ),
            )
            .drive(
              Tween<double>(begin: 800, end: 0),
            ),
      );
    });

    _runAnimation();
  }

  void _runAnimation() async {
    await _cardEntranceAnimationController.forward();
    setState(() {});
  }

  @override
  void dispose() {
    _cardEntranceAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AirAsiaBar(
            height: 180,
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + 64,
            child: SingleChildScrollView(
              child: Column(
                children: _buildTickets().toList(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Iterable<Widget> _buildTickets() {
    return stops.map(
      (stop) {
        final animation = _ticketAnimations[stop];
        return AnimatedBuilder(
          animation: animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: TicketCard(stop: stop),
          ),
          builder: (context, child) => Transform.translate(
                offset: Offset(0, animation.value),
                child: child,
              ),
        );
      },
    );
  }

  Widget _buildFab() {
    if (_cardEntranceAnimationController.status != AnimationStatus.completed) {
      return null;
    }
    return FloatingActionButton(
      onPressed: () => rootNavigatorKey.currentState.pop(),
      child: const Icon(Icons.fingerprint),
    );
  }
}

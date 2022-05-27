import 'package:flutter/foundation.dart';

@immutable
class FlightStopTicket {
  const FlightStopTicket({
    required this.from,
    required this.fromShort,
    required this.to,
    required this.toShort,
    required this.flightNumber,
  });
  final String from;
  final String fromShort;
  final String to;
  final String toShort;
  final String flightNumber;
}

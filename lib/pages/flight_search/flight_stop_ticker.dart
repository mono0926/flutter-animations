import 'package:meta/meta.dart';

@immutable
class FlightStopTicket {
  const FlightStopTicket({
    this.from,
    this.fromShort,
    this.to,
    this.toShort,
    this.flightNumber,
  });
  final String from;
  final String fromShort;
  final String to;
  final String toShort;
  final String flightNumber;
}

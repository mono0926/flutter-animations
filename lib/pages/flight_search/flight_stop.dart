import 'package:meta/meta.dart';

@immutable
class FlightStop {
  const FlightStop({
    @required this.from,
    @required this.to,
    @required this.date,
    @required this.duration,
    @required this.price,
    @required this.fromToTime,
  });

  final String from;
  final String to;
  final String date;
  final String duration;
  final String price;
  final String fromToTime;
}

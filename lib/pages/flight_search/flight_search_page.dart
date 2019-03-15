import 'package:animations/pages/flight_search/air_asia_bar.dart';
import 'package:animations/pages/flight_search/content_card.dart';
import 'package:animations/pages/flight_search/rounded_button.dart';
import 'package:flutter/material.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage();

  static const routeName = 'FlightSearchPage';

  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  var _showInput = true;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Theme(
      data: new ThemeData(
        primarySwatch: Colors.red,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            AirAsiaBar(height: top + 200),
            // TODO: 不要かも？
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: top + 40.0),
                child: Column(
                  children: [
                    _buildButtonsRow(),
                    Expanded(
                      child: ContentCard(
                        showInput: _showInput,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _showInput
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _showInput = !_showInput;
                  });
                },
                child: const Icon(
                  Icons.timeline,
                  size: 36,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const RoundedButton(text: 'ONE WAY'),
          const RoundedButton(text: 'ROUND'),
          const RoundedButton(text: 'MULTICITY', selected: true),
        ],
      ),
    );
  }
}

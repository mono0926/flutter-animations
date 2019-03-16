import 'package:animations/pages/flight_search/air_asia_bar.dart';
import 'package:animations/pages/flight_search/content_card.dart';
import 'package:animations/pages/flight_search/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

enum FlightSearchMode { normal, plane, done }

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage();

  static const routeName = 'FlightSearchPage';

  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  var _mode = FlightSearchMode.normal;
  var _isKeyboardVisible = false;
  final _keyboardVisibilityNotification = KeyboardVisibilityNotification();
  int _keyboardVisibilityNotificationSubscription;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityNotificationSubscription =
        _keyboardVisibilityNotification.addNewListener(onChange: (visible) {
      setState(() {
        _isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    _keyboardVisibilityNotification
        .removeListener(_keyboardVisibilityNotificationSubscription);
    super.dispose();
  }

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
                        showInput: _mode == FlightSearchMode.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildFab(),
      ),
    );
  }

  Widget _buildFab() {
    if (_isKeyboardVisible) {
      return null;
    }
    switch (_mode) {
      case FlightSearchMode.normal:
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              _mode = FlightSearchMode.plane;
            });
          },
          child: const Icon(
            Icons.timeline,
            size: 36,
          ),
        );
      case FlightSearchMode.plane:
        return null;
      case FlightSearchMode.done:
        return null;
    }
    assert(false);
    return null;
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

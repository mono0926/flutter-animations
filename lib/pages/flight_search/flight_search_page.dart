import 'package:animations/app.dart';
import 'package:animations/pages/flight_search/air_asia_bar.dart';
import 'package:animations/pages/flight_search/content_card.dart';
import 'package:animations/pages/flight_search/fade_route.dart';
import 'package:animations/pages/flight_search/rounded_button.dart';
import 'package:animations/pages/flight_search/ticker_page.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

enum FlightSearchMode { normal, plane, done }

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({Key key}) : super(key: key);

  static const routeName = 'FlightSearchPage';

  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  var _mode = FlightSearchMode.normal;
  var _isKeyboardVisible = false;
  var _selectedButtonIndex = 2;
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
    return Scaffold(
      body: Stack(
        children: [
          AirAsiaBar(
            height: top + 200,
            leading: IconButton(
              icon: const BackButtonIcon(),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () {
                rootNavigatorKey.currentState.pop();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: top + 40.0),
            child: Column(
              children: [
                _buildButtonsRow(),
                Expanded(
                  child: ContentCard(
                    onCompleted: () {
                      setState(() {
                        _mode = FlightSearchMode.done;
                      });
                    },
                    showInput: _mode == FlightSearchMode.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFab(),
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
        return FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(FadeRoute(builder: (context) => TicketsPage()));
          },
          child: const Icon(
            Icons.check,
            size: 36,
          ),
        );
    }
    assert(false);
    return null;
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          RoundedButton(
            text: 'ONE WAY',
            selected: _selectedButtonIndex == 0,
            onPressed: () {
              setState(() => _selectedButtonIndex = 0);
            },
          ),
          RoundedButton(
            text: 'ROUND',
            selected: _selectedButtonIndex == 1,
            onPressed: () {
              setState(() => _selectedButtonIndex = 1);
            },
          ),
          RoundedButton(
            text: 'MULTICITY',
            selected: _selectedButtonIndex == 2,
            onPressed: () {
              setState(() => _selectedButtonIndex = 2);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:animations/app.dart';
import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  const AirAsiaBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(context),
        _buildAppBar(context),
      ],
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            const Color(0xFFE64C85),
          ],
        ),
      ),
      height: height,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const BackButtonIcon(),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          rootNavigatorKey.currentState.pop();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'AirAsia',
        style: TextStyle(
          fontFamily: 'NothingYouCouldDo',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  const AirAsiaBar({
    Key key,
    @required this.height,
    this.leading,
  }) : super(key: key);

  final double height;
  final Widget leading;

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
      leading: leading,
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

import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  const PriceTab({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab>
    with SingleTickerProviderStateMixin {
  static const double _initialPlanePaddingBottom = 16;
  static const double _planeSize = 60;

  double get _planeTopPadding =>
      widget.height - (_initialPlanePaddingBottom + _planeSize);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [_buildPlane()],
    );
  }

  Widget _buildPlane() {
    return Positioned(
      top: _planeTopPadding,
      child: Column(
        children: [
          _buildPlaneIcon(),
        ],
      ),
    );
  }

  Widget _buildPlaneIcon() {
    return const Icon(
      Icons.airplanemode_active,
      color: Colors.red,
      size: _planeSize,
    );
  }
}

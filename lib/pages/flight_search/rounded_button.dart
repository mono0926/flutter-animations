import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.text,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool selected;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: AnimatedCrossFade(
          firstChild: _buildSelectedButton(context),
          secondChild: _buildUnselectedButton(),
          crossFadeState:
              selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }

  OutlineButton _buildUnselectedButton() {
    final color = Colors.white;
    return OutlineButton(
      borderSide: BorderSide(color: color),
      highlightedBorderColor: color,
      textColor: color,
      color: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Center(child: Text(text)),
    );
  }

  Widget _buildSelectedButton(BuildContext context) {
    final textColor = Theme.of(context).primaryColor;
    return RaisedButton(
      elevation: 0,
      highlightElevation: 0,
      textColor: textColor,
      color: Colors.white,
      onPressed: onPressed ?? () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Center(child: Text(text)),
    );
  }
}

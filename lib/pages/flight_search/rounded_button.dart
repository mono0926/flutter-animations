import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    this.selected = false,
    this.onPressed,
  });

  final String text;
  final bool selected;
  final GestureTapCallback? onPressed;

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

  Widget _buildUnselectedButton() {
    const color = Colors.white;
    return TextButton(
      style: TextButton.styleFrom(
        side: const BorderSide(color: color),
        primary: Colors.white,
        onSurface: color,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Center(child: Text(text)),
    );
  }

  Widget _buildSelectedButton(BuildContext context) {
    final textColor = Theme.of(context).primaryColor;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        onPrimary: textColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed ?? () {},
      child: Center(child: Text(text)),
    );
  }
}

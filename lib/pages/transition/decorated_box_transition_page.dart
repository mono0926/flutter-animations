import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  static const routeName = 'DecoratedBoxTransition';

  @override
  _DecoratedBoxTransitionPageState createState() =>
      _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  var _isScaledUp = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'DecoratedBoxTransition',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isScaledUp) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          _isScaledUp = !_isScaledUp;
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: DecoratedBoxTransition(
          decoration: _animationController
              .drive(
                CurveTween(curve: Curves.fastOutSlowIn),
              )
              .drive(
                DecorationTween(
                  begin: const FlutterLogoDecoration(
                    style: FlutterLogoStyle.horizontal,
                  ),
                  end: const FlutterLogoDecoration(
                    style: FlutterLogoStyle.stacked,
                  ),
                ),
              ),
          child: const SizedBox(
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

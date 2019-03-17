import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class SizeTransitionPage extends StatefulWidget {
  static const routeName = 'SizeTransition';

  @override
  _SizeTransitionPageState createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _isScaledUp = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'SizeTransition',
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
      child: SizeTransition(
        axis: Axis.vertical, // default
        axisAlignment: -0.3,
        sizeFactor: _animationController
            .drive(
              CurveTween(curve: Curves.fastOutSlowIn),
            )
            .drive(
              Tween<double>(
                begin: 0.2,
                end: 1,
              ),
            ),
        child: Image.asset('assets/love.png'),
      ),
    );
  }
}

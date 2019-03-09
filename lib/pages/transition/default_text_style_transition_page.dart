import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class DefaultTextStyleTransitionPage extends StatefulWidget {
  static const routeName = 'DefaultTextStyleTransition';

  @override
  _DefaultTextStyleTransitionPageState createState() =>
      _DefaultTextStyleTransitionPageState();
}

class _DefaultTextStyleTransitionPageState
    extends State<DefaultTextStyleTransitionPage>
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
      title: 'DefaultTextStyleTransition',
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
      child: DefaultTextStyleTransition(
        style: _animationController
            .drive(
              CurveTween(curve: Curves.fastOutSlowIn),
            )
            .drive(
              TextStyleTween(
                begin: Theme.of(context).textTheme.display1,
                end: Theme.of(context).textTheme.display4,
              ),
            ),
        child: Center(child: const Text('Flutter')),
      ),
    );
  }
}

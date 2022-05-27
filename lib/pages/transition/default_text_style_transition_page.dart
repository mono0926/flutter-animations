import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class DefaultTextStyleTransitionPage extends StatefulWidget {
  const DefaultTextStyleTransitionPage({super.key});

  static const routeName = 'DefaultTextStyleTransition';

  @override
  State<DefaultTextStyleTransitionPage> createState() =>
      _DefaultTextStyleTransitionPageState();
}

class _DefaultTextStyleTransitionPageState
    extends State<DefaultTextStyleTransitionPage>
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
                begin: Theme.of(context).textTheme.headline4,
                end: Theme.of(context).textTheme.headline1,
              ),
            ),
        child: const Center(child: Text('Flutter')),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class RelativePositionedTransitionPage extends StatefulWidget {
  static const routeName = 'RelativePositionedTransition';

  @override
  _RelativePositionedTransitionPageState createState() =>
      _RelativePositionedTransitionPageState();
}

class _RelativePositionedTransitionPageState
    extends State<RelativePositionedTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _isMoved = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
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
      title: 'RelativePositionedTransition',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isMoved) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          _isMoved = !_isMoved;
        },
        child: const Icon(Icons.refresh),
      ),
      child: Stack(
        children: [
          RelativePositionedTransition(
            rect: _animationController
                .drive(
                  CurveTween(
                    curve: Curves.elasticInOut,
                  ),
                )
                .drive(
                  RectTween(
                    begin: Rect.fromLTRB(10, 10, -100, -400),
                    end: Rect.fromLTRB(200, 500, 0, 0),
                  ),
                ),
            size: const Size(50, 50),
            child: Image.asset(
              'assets/love.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

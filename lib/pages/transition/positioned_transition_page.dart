import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class PositionedTransitionPage extends StatefulWidget {
  const PositionedTransitionPage({super.key});

  static const routeName = 'PositionedTransition';

  @override
  State<PositionedTransitionPage> createState() =>
      _PositionedTransitionPageState();
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
  );
  var _isMoved = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'PositionedTransition',
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
          PositionedTransition(
            rect: _animationController
                .drive(
                  CurveTween(
                    curve: Curves.elasticInOut,
                  ),
                )
                .drive(
                  RelativeRectTween(
                    begin: const RelativeRect.fromLTRB(10, 10, 200, 400),
                    end: const RelativeRect.fromLTRB(100, 400, 10, 10),
                  ),
                ),
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

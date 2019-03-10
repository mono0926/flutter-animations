import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class AlignTransitionPage extends StatefulWidget {
  static const routeName = 'AlignTransition';

  @override
  _AlignTransitionPageState createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _isMoved = false;

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
      title: 'AlignTransition',
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
          AlignTransition(
            alignment: _animationController
                .drive(
                  CurveTween(
                    curve: const Interval(0.4, 1, curve: Curves.fastOutSlowIn),
                  ),
                )
                .drive(
                  AlignmentTween(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
            child: Image.asset(
              'assets/love_gray.png',
              width: 200,
            ),
          ),
          AlignTransition(
            alignment: _animationController
                .drive(
                  CurveTween(
                    curve: const Interval(0, 0.6, curve: Curves.fastOutSlowIn),
                  ),
                )
                .drive(
                  AlignmentTween(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
            child: Image.asset(
              'assets/love.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

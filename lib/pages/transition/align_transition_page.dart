import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class AlignTransitionPage extends StatefulWidget {
  const AlignTransitionPage({super.key});

  static const routeName = 'AlignTransition';

  @override
  State<AlignTransitionPage> createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
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

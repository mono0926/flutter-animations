import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class RelativePositionedTransitionPage extends StatefulWidget {
  const RelativePositionedTransitionPage({super.key});

  static const routeName = 'RelativePositionedTransition';

  @override
  State<RelativePositionedTransitionPage> createState() =>
      _RelativePositionedTransitionPageState();
}

class _RelativePositionedTransitionPageState
    extends State<RelativePositionedTransitionPage>
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
            // TODO(mono): broken
            // type 'RectTween' is not a subtype
            // of type 'Animatable<Rect>' in type cast
            rect: _animationController
                .drive(
                  CurveTween(
                    curve: Curves.elasticInOut,
                  ),
                )
                .drive(
                  RectTween(
                    begin: const Rect.fromLTRB(10, 10, -100, -400),
                    end: const Rect.fromLTRB(200, 500, 0, 0),
                  ) as Animatable<Rect>,
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

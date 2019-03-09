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
      title: 'AlignTransition',
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
      child: Stack(
        children: [
          AlignTransition(
            alignment: _animationController
                .drive(
                  CurveTween(curve: Curves.fastOutSlowIn),
                )
                .drive(
                  AlignmentGeometryTween(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
            child: SizedBox(width: 200, child: Image.asset('assets/love.png')),
          ),
        ],
      ),
    );
  }
}

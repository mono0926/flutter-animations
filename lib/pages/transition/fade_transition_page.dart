import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class FadeTransitionPage extends StatefulWidget {
  static const routeName = 'FadeTransition';

  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

class _FadeTransitionPageState extends State<FadeTransitionPage>
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
      title: 'FadeTransition',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_isScaledUp) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            _isScaledUp = !_isScaledUp;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Column(
        children: [
          FadeTransition(
            opacity: _animationController
                .drive(
                  CurveTween(curve: Curves.fastOutSlowIn),
                )
                .drive(
                  Tween<double>(
                    begin: 1,
                    end: 0.2,
                  ),
                ),
            child: Image.asset('assets/love.png'),
          )
        ],
      ),
    );
  }
}

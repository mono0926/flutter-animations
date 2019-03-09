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
    final height = MediaQuery.of(context).size.width / 2;
    return AppScaffold(
      title: 'FadeTransition',
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
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: Row(
              children: [
                _buildContent(0),
                _buildContent(0.2),
              ],
            ),
          ),
          SizedBox(
            height: height,
            child: Row(
              children: [
                _buildContent(0.4),
                _buildContent(0.6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  FadeTransition _buildContent(double start) {
    return FadeTransition(
      opacity: _animationController
          .drive(
            CurveTween(
                curve: Interval(
              start,
              start + 0.4,
              curve: Curves.fastOutSlowIn,
            )),
          )
          .drive(
            Tween<double>(
              begin: 0.1,
              end: 1,
            ),
          ),
      child: Image.asset('assets/love.png'),
    );
  }
}

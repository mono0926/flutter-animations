import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class SlideTransitionPage extends StatefulWidget {
  static const routeName = 'slideTransition';

  @override
  _SlideTransitionPageState createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

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
      title: 'SlideTransition',
      child: Stack(
        children: [
          _buildContent(),
          SlideTransition(
            position: _animationController
                .drive(CurveTween(curve: Curves.easeInOut))
                .drive(
                  Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0, -1),
                  ),
                ),
            child: _buildTransitionScreen(),
          ),
        ],
      ),
    );
  }

  Column _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/love.png'),
        RaisedButton(
          child: const Text('CLOSE'),
          onPressed: () {
            _animationController.reverse();
          },
        )
      ],
    );
  }

  Widget _buildTransitionScreen() {
    return SizedBox.expand(
      child: Container(
        color: Colors.black,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              _animationController.forward();
            },
            child: const Text('OPEN'),
          ),
        ),
      ),
    );
  }
}

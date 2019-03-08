import 'package:animations/widget/animation_object.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

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
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'SlideTransition',
      child: Stack(
        children: [
          _buildContent(),
          SlideTransition(
            position: _animationController.drive(
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
      children: <Widget>[
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

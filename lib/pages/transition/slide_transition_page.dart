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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _animationController.forward();
          _animationController.reverse();
        },
        child: const Icon(Icons.refresh),
      ),
      child: SlideTransition(
        position: _animationController.drive(
          Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1, 1),
          ),
        ),
        child: AnimationObject(),
      ),
    );
  }
}

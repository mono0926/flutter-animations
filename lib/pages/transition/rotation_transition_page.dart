import 'package:flutter/material.dart';

import '../../widget/app_scaffold.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({super.key});

  static const routeName = 'RotationTransition';

  @override
  State<RotationTransitionPage> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'RotationTransition',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward(from: 0);
        },
        child: const Icon(Icons.refresh),
      ),
      child: RotationTransition(
        alignment: Alignment.bottomCenter,
        turns: _animationController
            .drive(
              CurveTween(
                curve: Curves.elasticOut,
              ),
            )
            .drive(
              Tween<double>(
                begin: 0,
                end: 1,
              ),
            ),
        child: Image.asset('assets/love.png'),
      ),
    );
  }
}

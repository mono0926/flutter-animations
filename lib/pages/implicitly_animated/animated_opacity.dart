import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  static const routeName = 'animatedOpacity';

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  var _opaque = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedOpacity',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opaque = !_opaque;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _opaque ? 1 : 0.3,
          child: Image.asset('assets/love.png'),
        ),
      ),
    );
  }
}

import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  static const routeName = 'AnimatedModalBarrier';

  @override
  _AnimatedModalBarrierPageState createState() =>
      _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedModalBarrier',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: AnimatedModalBarrier(),
    );
  }
}

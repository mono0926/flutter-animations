import 'package:animations/widget/animation_object.dart';
import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  static const routeName = 'animatedAlign';

  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _alignmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedAlign',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _alignmentIndex++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: AnimatedAlign(
        alignment: _alignments[_alignmentIndex % 4],
        duration: Duration(milliseconds: 500),
        child: AnimationObject(),
        curve: Curves.easeInOut,
      ),
    );
  }
}

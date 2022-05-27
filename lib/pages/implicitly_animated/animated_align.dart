import 'package:animations_app/widget/animation_object.dart';
import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  static const routeName = 'animatedAlign';

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedAlign',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: AnimatedAlign(
        alignment: _alignment,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: const AnimationObject(),
      ),
    );
  }
}

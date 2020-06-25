import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  static const routeName = 'AnimatedDefaultTextStyle';

  @override
  _AnimatedDefaultTextStylePageState createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  var _index = 0;
  TextStyle get _textStyle {
    switch (_index % 4) {
      case 0:
        return Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.red);
      case 1:
        return Theme.of(context)
            .textTheme
            .headline3
            .copyWith(color: Colors.green);
      case 2:
        return Theme.of(context)
            .textTheme
            .headline2
            .copyWith(color: Colors.blue);
      case 3:
        return Theme.of(context)
            .textTheme
            .headline1
            .copyWith(color: Colors.orange);
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedDefaultTextStyle',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          child: const Text('Flutter'),
          curve: Curves.easeInOut,
          style: _textStyle,
        ),
      ),
    );
  }
}

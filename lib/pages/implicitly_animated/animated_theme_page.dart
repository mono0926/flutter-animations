import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedThemePage extends StatefulWidget {
  static const routeName = 'animatedTheme';

  @override
  _AnimatedThemePageState createState() => _AnimatedThemePageState();
}

class _AnimatedThemePageState extends State<AnimatedThemePage> {
  var _isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedTheme',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLightTheme = !_isLightTheme;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      child: Center(
        child: AnimatedTheme(
          data: _isLightTheme ? ThemeData.light() : ThemeData.dark(),
          duration: const Duration(milliseconds: 500),
          child: Card(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'hello',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

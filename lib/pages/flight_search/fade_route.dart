import 'package:flutter/material.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({
    @required WidgetBuilder builder,
  }) : super(
          builder: builder,
          fullscreenDialog: true,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

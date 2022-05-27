import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  const AnimatedModalBarrierPage({super.key});

  static const routeName = 'AnimatedModalBarrier';

  @override
  State<AnimatedModalBarrierPage> createState() {
    return _AnimatedModalBarrierPageState();
  }
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> {
  var _dismissible = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedModalBarrier',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                  MyPageRoute(
                    page: _ModalPage(),
                    dismissible: _dismissible,
                  ),
                );
              },
              child: const Text('Open Modal View'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('dismissible'),
                Switch(
                  onChanged: (value) {
                    setState(() {
                      _dismissible = value;
                    });
                  },
                  value: _dismissible,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyPageRoute extends TransitionRoute<void> {
  MyPageRoute({
    required this.page,
    required this.dismissible,
  });

  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder: _buildModalBarrier),
      OverlayEntry(builder: (context) => Center(child: page))
    ];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  Widget _buildModalBarrier(BuildContext context) {
    final animation = this.animation!;
    return IgnorePointer(
      // changedInternalState is called when this updates
      ignoring: animation.status == AnimationStatus.reverse ||
          // dismissed is possible when doing a manual pop gesture
          animation.status == AnimationStatus.dismissed,
      child: AnimatedModalBarrier(
        color: animation.drive(
          ColorTween(
            begin: Colors.transparent,
            end: Colors.black.withAlpha(80),
          ),
        ),
        dismissible: dismissible,
      ),
    );
  }
}

class _ModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('(　´･‿･｀)'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}

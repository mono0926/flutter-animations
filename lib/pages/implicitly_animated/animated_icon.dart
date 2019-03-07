import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
class AnimatedIconPage extends StatefulWidget {
  static const routeName = 'AnimatedIcon';

  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _playButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _play() async {
    setState(() {
      _playButtonEnabled = false;
    });
    await _animationController.forward(from: 0);
    await Future.delayed(const Duration(seconds: 2));
    await _animationController.reverse();
    setState(() {
      _playButtonEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AnimatedIcon',
      floatingActionButton: _playButtonEnabled
          ? FloatingActionButton(
              onPressed: _play,
              child: const Icon(Icons.play_arrow),
            )
          : null,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAnimatedIcon(AnimatedIcons.add_event, label: 'add_event'),
            _buildAnimatedIcon(AnimatedIcons.pause_play, label: 'pause_play'),
            _buildAnimatedIcon(AnimatedIcons.close_menu, label: 'close_menu'),
            _buildAnimatedIcon(AnimatedIcons.ellipsis_search,
                label: 'ellipsis_search'),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(AnimatedIconData icon, {@required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedIcon(
          icon: icon,
          progress: _animationController,
        ),
        const SizedBox(height: 8),
        Text(label)
      ],
    );
  }
}

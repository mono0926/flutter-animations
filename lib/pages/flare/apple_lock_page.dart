import 'package:animations_app/widget/widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AppleLockPage extends StatefulWidget {
  const AppleLockPage({super.key});

  static const routeName = 'AppleLock';
  @override
  State<AppleLockPage> createState() => _AppleLockPageState();
}

class _AppleLockPageState extends State<AppleLockPage> {
  var _isLocked = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Flare Example ',
      child: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: _isLocked
                    ? const FlareActor(
                        'assets/apple_lock.flr',
                        animation: 'Untitled',
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() => _isLocked = !_isLocked);
                },
                child: const Text('LOCK'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

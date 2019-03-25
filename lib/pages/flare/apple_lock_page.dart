import 'package:animations/widget/widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AppleLockPage extends StatefulWidget {
  static const routeName = 'AppleLock';
  @override
  _AppleLockPageState createState() => _AppleLockPageState();
}

class _AppleLockPageState extends State<AppleLockPage> {
  var _isLocked = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Flare Example ',
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: _isLocked
                    ? FlareActor(
                        'assets/apple_lock.flr',
                        animation: 'Untitled',
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              RaisedButton(
                child: const Text('LOCK'),
                onPressed: () {
                  setState(() => _isLocked = !_isLocked);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

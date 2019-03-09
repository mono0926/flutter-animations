import 'package:animations/widget/widget.dart';
import 'package:flutter/material.dart';

const _heroTag = 'imageHero';
final _image = Image.asset('assets/love.png');

class HeroPage extends StatelessWidget {
  static const routeName = 'Hero';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Hero',
      child: GestureDetector(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Hero(
                tag: _heroTag,
                child: _image,
              ),
              const SizedBox(width: 16),
              const Text('I am a dog 🐶'),
            ],
          ),
        ),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailScreen())),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Detail',
      child: Center(
        child: Hero(
          tag: _heroTag,
          child: _image,
        ),
      ),
    );
  }
}

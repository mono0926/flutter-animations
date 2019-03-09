import 'package:animations/widget/widget.dart';
import 'package:flutter/material.dart';

const _heroTagImage = 'image';
const _heroTagText = 'text';
final _image = Image.asset('assets/love.png');
const _text = 'I am a dog 🐶';

class HeroPage extends StatelessWidget {
  static const routeName = 'Hero';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Hero',
      child: InkWell(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Hero(
                tag: _heroTagImage,
                child: _image,
              ),
              const SizedBox(width: 16),
              Hero(
                tag: _heroTagText,
                child: Material(
                  color: Colors.transparent,
                  child: const Text(_text),
                ),
              ),
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
      child: Column(
        children: [
          Hero(
            tag: _heroTagImage,
            child: _image,
          ),
          const SizedBox(height: 16),
          Hero(
            tag: _heroTagText,
            child: Material(
              color: Colors.transparent,
              child: Text(
                _text,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

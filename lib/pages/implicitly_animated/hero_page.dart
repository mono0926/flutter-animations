import 'package:animations_app/widget/widget.dart';
import 'package:flutter/material.dart';

const _heroTagImage = 'image';
const _heroTagText = 'text';
final _image = Image.asset('assets/love.png');
const _text = 'I am a dog 🐶';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  static const routeName = 'Hero';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Hero',
      child: InkWell(
        onTap: () => Navigator.of(context).push<void>(
          MaterialPageRoute(builder: (context) => const DetailScreen()),
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Hero(
                tag: _heroTagImage,
                child: _image,
              ),
              const SizedBox(width: 16),
              const Hero(
                tag: _heroTagText,
                child: Material(
                  color: Colors.transparent,
                  child: Text(_text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
          const Hero(
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

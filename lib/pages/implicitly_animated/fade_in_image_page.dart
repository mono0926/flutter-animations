import 'package:animations/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImagePage extends StatefulWidget {
  static const routeName = 'FadeInImage';

  @override
  _FadeInImagePageState createState() => _FadeInImagePageState();
}

class _FadeInImagePageState extends State<FadeInImagePage> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'FadeInImage',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => index++);
        },
        child: const Icon(Icons.refresh),
      ),
      child: index % 2 == 0
          ? Stack(
              children: [
                Center(child: const CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://picsum.photos/400?image=$index',
                    fadeInCurve: Curves.easeInOut,
                  ),
                  /*
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/love_gray.png',
                    image: 'https://picsum.photos/400?image=$index',
                    fadeInCurve: Curves.easeInOut,
                  ),
                  */
                ),
              ],
            )
          : Center(
              child: const Text('Press button one more.'),
            ),
    );
  }
}

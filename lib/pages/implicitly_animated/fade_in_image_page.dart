import 'package:animations_app/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImagePage extends StatefulWidget {
  const FadeInImagePage({super.key});

  static const routeName = 'FadeInImage';

  @override
  State<FadeInImagePage> createState() => _FadeInImagePageState();
}

class _FadeInImagePageState extends State<FadeInImagePage> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'FadeInImage',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _index++);
        },
        child: const Icon(Icons.refresh),
      ),
      child: _index.isEven
          ? Stack(
              children: [
                const Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://picsum.photos/400?image=$_index',
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
          : const Center(
              child: Text('Press button one more.'),
            ),
    );
  }
}

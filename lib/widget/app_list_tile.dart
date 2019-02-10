import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key key,
    this.title,
    this.nextRouteName,
  }) : super(key: key);

  final String title;
  final String nextRouteName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushNamed(nextRouteName);
      },
    );
  }
}

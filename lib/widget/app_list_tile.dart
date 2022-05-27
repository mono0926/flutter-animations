import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    required this.nextRouteName,
  });

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

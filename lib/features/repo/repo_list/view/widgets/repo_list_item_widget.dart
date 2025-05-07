import 'package:flutter/material.dart';

class RepoListItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const RepoListItemWidget({
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}

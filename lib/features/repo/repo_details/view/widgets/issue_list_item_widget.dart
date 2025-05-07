import 'package:flutter/material.dart';
import 'package:git_finder/features/repo/repo_details/data/models/issue.dart';

class IssueListItemWidget extends StatelessWidget {
  final Issue issue;
  const IssueListItemWidget({
    required this.issue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedTitle = truncate(text: issue.title);
    String truncatedBody = truncate(text: issue.body);

    return ListTile(
      title: Text(truncatedTitle),
      subtitle: Text(truncatedBody),
      leading: CircleAvatar(
        child: Text(issue.number.toString()),
      ),
      trailing: Text(issue.state),
    );
  }

  String truncate({required String text, int length = 50}) {
    return text.length > length ? '${text.substring(0, length)}...' : text;
  }
}

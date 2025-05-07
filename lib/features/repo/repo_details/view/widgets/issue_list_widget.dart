import 'package:flutter/material.dart';
import 'package:git_finder/features/repo/repo_details/data/models/issue.dart';
import 'package:git_finder/features/repo/repo_details/view/widgets/issue_list_item_widget.dart';

class IssueListWidget extends StatelessWidget {
  final List<Issue> issues;
  final Future<void> Function() onRefresh;
  const IssueListWidget({
    required this.issues,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Text('Issues', textAlign: TextAlign.center),
        Divider(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              itemBuilder: (_, int index) => IssueListItemWidget(issue: issues[index]),
              itemCount: issues.length,
            ),
          ),
        ),
      ],
    );
  }
}

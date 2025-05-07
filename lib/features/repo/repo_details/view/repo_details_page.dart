import 'package:flutter/material.dart';
import 'package:git_finder/features/repo/repo_details/view/widgets/repo_details_header_widget.dart';
import 'package:git_finder/features/repo/repo_details/view/widgets/repo_details_issues_widget.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:git_finder/styles/edges.dart';

class RepoDetailsPage extends StatelessWidget {
  final Repo repo;
  const RepoDetailsPage({required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Edges.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RepoDetailsHeaderWidget(repo: repo),
            Expanded(child: RepoDetailsIssuesWidget()),
          ],
        ),
      ),
    );
  }
}

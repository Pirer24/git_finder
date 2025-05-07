import 'package:flutter/material.dart';
import 'package:git_finder/features/core/router/go_routes.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:git_finder/features/repo/repo_list/view/widgets/repo_list_item_widget.dart';
import 'package:go_router/go_router.dart';

class RepoListWidget extends StatelessWidget {
  final List<Repo> repos;
  final Future<void> Function() onRefresh;
  const RepoListWidget({
    required this.repos,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemBuilder: (_, int index) {
          final Repo repo = repos[index];
          return RepoListItemWidget(
            title: repo.name,
            onTap: () => _navToDetails(context, repo),
          );
        },
        itemCount: repos.length,
      ),
    );
  }

  void _navToDetails(BuildContext context, Repo repo) {
    context.pushNamed(GoRoutes.repo.details, extra: repo);
  }
}

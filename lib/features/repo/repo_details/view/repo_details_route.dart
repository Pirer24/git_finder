import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_details/bloc/repo_details_bloc.dart';
import 'package:git_finder/features/repo/repo_details/data/repositories/issue_repository.dart';
import 'package:git_finder/features/repo/repo_details/view/repo_details_page.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:go_router/go_router.dart';

class RepoDetailsRoute extends StatelessWidget {
  const RepoDetailsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final Repo repo = GoRouterState.of(context).extra as Repo;
    return BlocProvider(
      create: (context) => RepoDetailsBloc(
        issueRepository: IssueRepositoryImpl(),
      )..add(RepoDetailsInit(repo)),
      child: RepoDetailsPage(
        repo: repo,
      ),
    );
  }
}

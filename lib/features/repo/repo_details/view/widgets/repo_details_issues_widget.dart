import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_details/bloc/repo_details_bloc.dart';
import 'package:git_finder/features/repo/repo_details/view/widgets/issue_list_widget.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';

class RepoDetailsIssuesWidget extends StatelessWidget {
  const RepoDetailsIssuesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoDetailsBloc, RepoDetailsState>(
      builder: (BuildContext context, RepoDetailsState state) {
        if (state is RepoDetailsLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is RepoDetailsError) {
          return Center(child: Text(state.message));
        }

        if (state is RepoDetailsLoaded) {
          return IssueListWidget(
            issues: state.issues,
            onRefresh: () => _onRefresh(context, state.repo),
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  Future<void> _onRefresh(BuildContext context, Repo repo) async {
    RepoDetailsBloc.of(context).add(RepoDetailsRefresh(repo));
  }
}

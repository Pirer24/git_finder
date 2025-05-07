import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_details/data/models/issue.dart';
import 'package:git_finder/features/repo/repo_details/data/repositories/issue_repository.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';

part 'repo_details_event.dart';
part 'repo_details_state.dart';

class RepoDetailsBloc extends Bloc<RepoDetailsEvent, RepoDetailsState> {
  final IssueRepository issueRepository;
  RepoDetailsBloc({
    required this.issueRepository,
  }) : super(RepoDetailsInitial()) {
    on<RepoDetailsInit>(_onRepoDetailsInit);
    on<RepoDetailsRefresh>(_onRepoRefresh);
  }

  static of(BuildContext context) => BlocProvider.of<RepoDetailsBloc>(context);

  Future<void> _onRepoDetailsInit(RepoDetailsInit event, Emitter<RepoDetailsState> emit) async {
    emit(RepoDetailsLoading());

    try {
      final List<Issue> issues = await issueRepository.getIssuesByRepo(event.repo.owner.login, event.repo.name);
      emit(RepoDetailsLoaded(repo: event.repo, issues: issues));
    } catch (e) {
      emit(RepoDetailsError(message: e.toString()));
    }
  }

  Future<void> _onRepoRefresh(RepoDetailsRefresh event, Emitter<RepoDetailsState> emit) async {
    await _onRepoDetailsInit(RepoDetailsInit(event.repo), emit);
  }
}

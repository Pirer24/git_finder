part of 'repo_details_bloc.dart';

sealed class RepoDetailsEvent {}

class RepoDetailsInit extends RepoDetailsEvent {
  final Repo repo;
  RepoDetailsInit(this.repo);
}

class RepoDetailsRefresh extends RepoDetailsEvent {
  final Repo repo;
  RepoDetailsRefresh(this.repo);
}

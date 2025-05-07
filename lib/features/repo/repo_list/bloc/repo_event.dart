part of 'repo_bloc.dart';

@immutable
sealed class RepoEvent {}

class RepoInit extends RepoEvent {}

class RepoRefresh extends RepoEvent {}

class RepoSearch extends RepoEvent {
  final String query;
  RepoSearch(this.query);
}

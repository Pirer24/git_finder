part of 'repo_list_bloc.dart';

@immutable
sealed class RepoListEvent {}

class RepoListInit extends RepoListEvent {}

class RepoListRefresh extends RepoListEvent {}

class RepoListSearch extends RepoListEvent {
  final String query;
  RepoListSearch(this.query);
}

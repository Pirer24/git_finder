part of 'repo_list_bloc.dart';

@immutable
sealed class RepoListState {}

final class RepoListInitial extends RepoListState {}

final class RepoListLoading extends RepoListState {}

final class RepoListLoaded extends RepoListState {
  final List<Repo> repos;
  RepoListLoaded({
    required this.repos,
  });
}

final class RepoListError extends RepoListState {
  final String message;
  RepoListError({
    required this.message,
  });
}

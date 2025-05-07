part of 'repo_details_bloc.dart';

sealed class RepoDetailsState {}

final class RepoDetailsInitial extends RepoDetailsState {}

final class RepoDetailsLoading extends RepoDetailsState {}

final class RepoDetailsLoaded extends RepoDetailsState {
  final Repo repo;
  final List<Issue> issues;
  RepoDetailsLoaded({
    required this.repo,
    required this.issues,
  });
}

final class RepoDetailsError extends RepoDetailsState {
  final String message;
  RepoDetailsError({
    required this.message,
  });
}

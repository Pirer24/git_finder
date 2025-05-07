part of 'repo_bloc.dart';

@immutable
sealed class RepoState {}

final class RepoInitial extends RepoState {}

final class RepoLoading extends RepoState {}

final class RepoLoaded extends RepoState {
  final List<Repo> repos;
  RepoLoaded({
    required this.repos,
  });
}

final class RepoError extends RepoState {
  final String message;
  RepoError({
    required this.message,
  });
}

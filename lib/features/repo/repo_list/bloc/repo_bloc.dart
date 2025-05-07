import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:git_finder/features/repo/repo_list/data/repositories/repo_repository.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final RepoRepository repoRepository;
  RepoBloc({
    required this.repoRepository,
  }) : super(RepoInitial()) {
    on<RepoInit>(_onRepoInit);
    on<RepoRefresh>(_onRepoRefresh);
    on<RepoSearch>(_onRepoSearch);
  }

  static of(BuildContext context) => BlocProvider.of<RepoBloc>(context);

  Future<void> _onRepoInit(_, Emitter<RepoState> emit) async {
    emit(RepoLoading());

    try {
      final List<Repo> repos = await repoRepository.getRepos();
      emit(RepoLoaded(repos: repos));
    } catch (e) {
      emit(RepoError(message: e.toString()));
    }
  }

  Future<void> _onRepoRefresh(_, Emitter<RepoState> emit) async {
    await _onRepoInit(null, emit);
  }

  Future<void> _onRepoSearch(RepoSearch event, Emitter<RepoState> emit) async {
    emit(RepoLoading());

    try {
      final List<Repo> repos = await repoRepository.getReposByQuery(event.query);
      emit(RepoLoaded(repos: repos));
    } catch (e) {
      emit(RepoError(message: e.toString()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:git_finder/features/repo/repo_list/data/repositories/repo_repository.dart';

part 'repo_list_event.dart';
part 'repo_list_state.dart';

class RepoListBloc extends Bloc<RepoListEvent, RepoListState> {
  final RepoRepository repoRepository;
  RepoListBloc({
    required this.repoRepository,
  }) : super(RepoListInitial()) {
    on<RepoListInit>(_onRepoInit);
    on<RepoListRefresh>(_onRepoRefresh);
    on<RepoListSearch>(_onRepoSearch);
  }

  static of(BuildContext context) => BlocProvider.of<RepoListBloc>(context);

  Future<void> _onRepoInit(_, Emitter<RepoListState> emit) async {
    emit(RepoListLoading());

    try {
      final List<Repo> repos = await repoRepository.getRepos();
      emit(RepoListLoaded(repos: repos));
    } catch (e) {
      emit(RepoListError(message: e.toString()));
    }
  }

  Future<void> _onRepoRefresh(_, Emitter<RepoListState> emit) async {
    await _onRepoInit(null, emit);
  }

  Future<void> _onRepoSearch(RepoListSearch event, Emitter<RepoListState> emit) async {
    emit(RepoListLoading());

    try {
      final List<Repo> repos = await repoRepository.getReposByQuery(event.query);
      emit(RepoListLoaded(repos: repos));
    } catch (e) {
      emit(RepoListError(message: e.toString()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/repo/repo_list/bloc/repo_bloc.dart';
import 'package:git_finder/features/repo/repo_list/data/repositories/repo_repository.dart';
import 'package:git_finder/features/repo/repo_list/view/repo_page.dart';

class RepoRoute extends StatelessWidget {
  const RepoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepoBloc(
        repoRepository: RepoRepositoryImpl(),
      )..add(RepoInit()),
      child: RepoPage(),
    );
  }
}

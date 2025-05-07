import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/core/consts/app_config.dart';
import 'package:git_finder/features/repo/repo_list/bloc/repo_bloc.dart';
import 'package:git_finder/features/repo/repo_list/view/widgets/repo_list_widget.dart';
import 'package:git_finder/features/repo/repo_list/view/widgets/repo_searchbar_widget.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({super.key});

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConfig.appName)),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<RepoBloc, RepoState>(
          builder: (BuildContext context, RepoState state) {
            return Column(
              children: [
                RepoSearchbarWidget(
                  controller: _controller,
                  onSubmitted: (query) => _onSubmitted(context, query),
                  enabled: state is RepoLoaded,
                ),
                if (state is RepoLoaded)
                  Expanded(
                    child: RepoListWidget(
                      repos: state.repos,
                      onRefresh: () => _onRefresh(context),
                    ),
                  ),
                if (state is RepoLoading)
                  Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is RepoError)
                  Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSubmitted(BuildContext context, String query) {
    if (query.isNotEmpty) {
      RepoBloc.of(context).add(RepoSearch(query));
    } else {
      RepoBloc.of(context).add(RepoInit());
    }
  }

  Future<void> _onRefresh(BuildContext context) async {
    _onSubmitted(context, _controller.text);
  }
}

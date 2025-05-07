import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_finder/features/core/consts/app_config.dart';
import 'package:git_finder/features/repo/repo_list/bloc/repo_list_bloc.dart';
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
        child: BlocBuilder<RepoListBloc, RepoListState>(
          builder: (BuildContext context, RepoListState state) {
            return Column(
              children: [
                RepoSearchbarWidget(
                  controller: _controller,
                  onSubmitted: (query) => _onSubmitted(context, query),
                  enabled: state is RepoListLoaded,
                ),
                if (state is RepoListLoaded)
                  Expanded(
                    child: RepoListWidget(
                      repos: state.repos,
                      onRefresh: () => _onRefresh(context),
                    ),
                  ),
                if (state is RepoListLoading)
                  Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is RepoListError)
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
      RepoListBloc.of(context).add(RepoListSearch(query));
    } else {
      RepoListBloc.of(context).add(RepoListInit());
    }
  }

  Future<void> _onRefresh(BuildContext context) async {
    _onSubmitted(context, _controller.text);
  }
}

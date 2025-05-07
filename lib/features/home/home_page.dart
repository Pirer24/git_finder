import 'package:flutter/material.dart';
import 'package:git_finder/features/core/consts/app_config.dart';
import 'package:git_finder/features/repo/repo_list/view/repo_page.dart';
import 'package:git_finder/styles/edges.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.appName),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Edges.medium),
        child: RepoPage(),
      ),
    );
  }
}

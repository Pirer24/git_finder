import 'package:flutter/material.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RepoDetailsHeaderWidget extends StatelessWidget {
  final Repo repo;
  const RepoDetailsHeaderWidget({required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Repo Name: ${repo.name}'),
        Text('Repo Full Name: ${repo.fullName}'),
        Text('Repo owner: ${repo.owner.login}'),
        InkWell(
          onTap: _openURL,
          child: Text('Repo URL: ${repo.htmlUrl}'),
        ),
      ],
    );
  }

  Future<void> _openURL() async {
    if (await canLaunchUrlString(repo.htmlUrl)) {
      await launchUrlString(repo.htmlUrl);
    }
  }
}

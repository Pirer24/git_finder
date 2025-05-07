import 'package:git_finder/features/core/repository/api_config.dart';
import 'package:git_finder/features/core/repository/core_repository.dart';
import 'package:git_finder/features/repo/repo_details/data/models/issue.dart';

abstract class IssueRepository {
  Future<List<Issue>> getIssuesByRepo(String owner, String repo);
}

class IssueRepositoryImpl extends CoreRepositoryImpl implements IssueRepository {
  IssueRepositoryImpl();

  @override
  Future<List<Issue>> getIssuesByRepo(String owner, String repo) async {
    return get(
      url: '${ApiConfig.baseUrl}/repos/$owner/$repo/issues?state=open',
    ).then((value) => Issue.fromList(value));
  }
}

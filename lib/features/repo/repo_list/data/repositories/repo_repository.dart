import 'package:git_finder/features/core/repository/api_config.dart';
import 'package:git_finder/features/core/repository/core_repository.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';

abstract class RepoRepository {
  Future<List<Repo>> getRepos();

  Future<List<Repo>> getReposByQuery(String query);
}

class RepoRepositoryImpl extends CoreRepositoryImpl implements RepoRepository {
  RepoRepositoryImpl();

  @override
  Future<List<Repo>> getRepos() async {
    return get(
      url: '${ApiConfig.baseUrl}/repositories',
    ).then((value) => Repo.fromList(value));
  }

  @override
  Future<List<Repo>> getReposByQuery(String query) async {
    return get(url: '${ApiConfig.baseUrl}/search/repositories', queryParameters: {
      'q': query,
    }).then((value) => Repo.fromList(value['items']));
  }
}

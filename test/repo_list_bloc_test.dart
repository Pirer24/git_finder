import 'package:flutter_test/flutter_test.dart';
import 'package:git_finder/features/repo/repo_list/bloc/repo_list_bloc.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:git_finder/features/repo/repo_list/data/repositories/repo_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockRepoRepository extends Mock implements RepoRepository {}

void main() {
  group('RepoListBloc', () {
    late RepoListBloc bloc;
    late MockRepoRepository mockRepoRepository;

    setUp(() {
      mockRepoRepository = MockRepoRepository();
      bloc = RepoListBloc(repoRepository: mockRepoRepository);
    });

    final repos = [
      Repo(
        id: 1,
        nodeId: 'node_1',
        name: 'test_repo',
        fullName: 'test_user/test_repo',
        isPrivate: false,
        owner: Owner(
          login: 'test_user',
          id: 1,
          nodeId: 'node_owner_1',
          avatarUrl: 'https://example.com/avatar.png',
          gravatarId: '',
          url: 'https://api.github.com/users/test_user',
          htmlUrl: 'https://github.com/test_user',
          followersUrl: '',
          followingUrl: '',
          gistsUrl: '',
          starredUrl: '',
          subscriptionsUrl: '',
          organizationsUrl: '',
          reposUrl: '',
          eventsUrl: '',
          receivedEventsUrl: '',
          type: 'User',
          siteAdmin: false,
        ),
        htmlUrl: 'https://github.com/test_user/test_repo',
        description: 'Test repository',
        fork: false,
        url: 'https://api.github.com/repos/test_user/test_repo',
        forksUrl: '',
        keysUrl: '',
        collaboratorsUrl: '',
        teamsUrl: '',
        hooksUrl: '',
        issueEventsUrl: '',
        eventsUrl: '',
        assigneesUrl: '',
        branchesUrl: '',
        tagsUrl: '',
        blobsUrl: '',
        gitTagsUrl: '',
        gitRefsUrl: '',
        treesUrl: '',
        statusesUrl: '',
        languagesUrl: '',
        stargazersUrl: '',
        contributorsUrl: '',
        subscribersUrl: '',
        subscriptionUrl: '',
        commitsUrl: '',
        gitCommitsUrl: '',
        commentsUrl: '',
        issueCommentUrl: '',
        contentsUrl: '',
        compareUrl: '',
        mergesUrl: '',
        archiveUrl: '',
        downloadsUrl: '',
        issuesUrl: '',
        pullsUrl: '',
        milestonesUrl: '',
        notificationsUrl: '',
        labelsUrl: '',
        releasesUrl: '',
        deploymentsUrl: '',
      ),
    ];

    test('emits [RepoLoading, RepoLoaded] when repositories are fetched successfully', () async {
      when(() => mockRepoRepository.getRepos()).thenAnswer((_) async => repos);

      bloc.add(RepoListInit());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoListLoading>(),
          isA<RepoListLoaded>().having((state) => state.repos, 'repos', repos),
        ]),
      );
    });

    test('emits [RepoLoading, RepoError] when fetching repositories fails', () async {
      when(() => mockRepoRepository.getRepos()).thenThrow(Exception('Failed to fetch repositories'));

      bloc.add(RepoListInit());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoListLoading>(),
          isA<RepoListError>().having((state) => state.message, 'message', 'Exception: Failed to fetch repositories'),
        ]),
      );
    });

    test('emits [RepoLoading, RepoLoaded] when searching repositories successfully', () async {
      when(() => mockRepoRepository.getReposByQuery(any())).thenAnswer((_) async => repos);

      bloc.add(RepoListSearch('test_query'));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoListLoading>(),
          isA<RepoListLoaded>().having((state) => state.repos, 'repos', repos),
        ]),
      );
    });

    test('emits [RepoLoading, RepoError] when searching repositories fails', () async {
      when(() => mockRepoRepository.getReposByQuery(any())).thenThrow(Exception('Failed to search repositories'));

      bloc.add(RepoListSearch('test_query'));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoListLoading>(),
          isA<RepoListError>().having((state) => state.message, 'message', 'Exception: Failed to search repositories'),
        ]),
      );
    });
  });
}

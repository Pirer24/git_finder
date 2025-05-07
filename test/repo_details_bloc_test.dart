import 'package:flutter_test/flutter_test.dart';
import 'package:git_finder/features/repo/repo_details/bloc/repo_details_bloc.dart';
import 'package:git_finder/features/repo/repo_details/data/models/issue.dart';
import 'package:git_finder/features/repo/repo_details/data/repositories/issue_repository.dart';
import 'package:git_finder/features/repo/repo_list/data/models/repo.dart';
import 'package:mocktail/mocktail.dart';

class MockIssueRepository extends Mock implements IssueRepository {}

void main() {
  group('RepoDetailsBloc', () {
    late RepoDetailsBloc bloc;
    late MockIssueRepository mockIssueRepository;

    setUp(() {
      mockIssueRepository = MockIssueRepository();
      bloc = RepoDetailsBloc(issueRepository: mockIssueRepository);
    });

    final repo = Repo(
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
    );

    final issues = [
      Issue(
        url: 'https://api.github.com/repos/test_user/test_repo/issues/1',
        repositoryUrl: '',
        labelsUrl: '',
        commentsUrl: '',
        eventsUrl: '',
        htmlUrl: '',
        id: 1,
        nodeId: '',
        number: 1,
        title: 'Test Issue',
        user: User(
          login: 'test_user',
          id: 1,
          nodeId: '',
          avatarUrl: '',
          gravatarId: '',
          url: '',
          htmlUrl: '',
          followersUrl: '',
          followingUrl: '',
          gistsUrl: '',
          starredUrl: '',
          subscriptionsUrl: '',
          organizationsUrl: '',
          reposUrl: '',
          eventsUrl: '',
          receivedEventsUrl: '',
          type: '',
          siteAdmin: false,
        ),
        labels: [],
        state: 'open',
        locked: false,
        assignee: null,
        assignees: [],
        milestone: null,
        comments: 0,
        createdAt: '',
        updatedAt: '',
        closedAt: null,
        authorAssociation: '',
        subIssuesSummary: null,
        activeLockReason: null,
        body: 'This is a test issue',
        closedBy: null,
        reactions: null,
        timelineUrl: '',
        performedViaGithubApp: null,
        stateReason: null,
      ),
    ];

    test('emits [RepoDetailsLoading, RepoDetailsLoaded] when issues are fetched successfully', () async {
      when(() => mockIssueRepository.getIssuesByRepo(any(), any())).thenAnswer((_) async => issues);

      bloc.add(RepoDetailsInit(repo));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoDetailsLoading>(),
          isA<RepoDetailsLoaded>().having((state) => state.issues, 'issues', issues),
        ]),
      );
    });

    test('emits [RepoDetailsLoading, RepoDetailsError] when fetching issues fails', () async {
      when(() => mockIssueRepository.getIssuesByRepo(any(), any())).thenThrow(Exception('Failed to fetch issues'));

      bloc.add(RepoDetailsInit(repo));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RepoDetailsLoading>(),
          isA<RepoDetailsError>().having((state) => state.message, 'message', 'Exception: Failed to fetch issues'),
        ]),
      );
    });
  });
}

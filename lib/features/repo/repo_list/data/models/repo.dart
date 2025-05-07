class Repo {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool isPrivate;
  final Owner owner;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String forksUrl;
  final String keysUrl;
  final String collaboratorsUrl;
  final String teamsUrl;
  final String hooksUrl;
  final String issueEventsUrl;
  final String eventsUrl;
  final String assigneesUrl;
  final String branchesUrl;
  final String tagsUrl;
  final String blobsUrl;
  final String gitTagsUrl;
  final String gitRefsUrl;
  final String treesUrl;
  final String statusesUrl;
  final String languagesUrl;
  final String stargazersUrl;
  final String contributorsUrl;
  final String subscribersUrl;
  final String subscriptionUrl;
  final String commitsUrl;
  final String gitCommitsUrl;
  final String commentsUrl;
  final String issueCommentUrl;
  final String contentsUrl;
  final String compareUrl;
  final String mergesUrl;
  final String archiveUrl;
  final String downloadsUrl;
  final String issuesUrl;
  final String pullsUrl;
  final String milestonesUrl;
  final String notificationsUrl;
  final String labelsUrl;
  final String releasesUrl;
  final String deploymentsUrl;

  Repo({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.isPrivate,
    required this.owner,
    required this.htmlUrl,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    this.description,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      isPrivate: json['private'],
      owner: Owner.fromJson(json['owner']),
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
      forksUrl: json['forks_url'],
      keysUrl: json['keys_url'],
      collaboratorsUrl: json['collaborators_url'],
      teamsUrl: json['teams_url'],
      hooksUrl: json['hooks_url'],
      issueEventsUrl: json['issue_events_url'],
      eventsUrl: json['events_url'],
      assigneesUrl: json['assignees_url'],
      branchesUrl: json['branches_url'],
      tagsUrl: json['tags_url'],
      blobsUrl: json['blobs_url'],
      gitTagsUrl: json['git_tags_url'],
      gitRefsUrl: json['git_refs_url'],
      treesUrl: json['trees_url'],
      statusesUrl: json['statuses_url'],
      languagesUrl: json['languages_url'],
      stargazersUrl: json['stargazers_url'],
      contributorsUrl: json['contributors_url'],
      subscribersUrl: json['subscribers_url'],
      subscriptionUrl: json['subscription_url'],
      commitsUrl: json['commits_url'],
      gitCommitsUrl: json['git_commits_url'],
      commentsUrl: json['comments_url'],
      issueCommentUrl: json['issue_comment_url'],
      contentsUrl: json['contents_url'],
      compareUrl: json['compare_url'],
      mergesUrl: json['merges_url'],
      archiveUrl: json['archive_url'],
      downloadsUrl: json['downloads_url'],
      issuesUrl: json['issues_url'],
      pullsUrl: json['pulls_url'],
      milestonesUrl: json['milestones_url'],
      notificationsUrl: json['notifications_url'],
      labelsUrl: json['labels_url'],
      releasesUrl: json['releases_url'],
      deploymentsUrl: json['deployments_url'],
    );
  }

  static List<Repo> fromList(List<dynamic> json) {
    return json.map((issue) => Repo.fromJson(issue)).toList();
  }
}

class Owner {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
      gravatarId: json['gravatar_id'],
      url: json['url'],
      htmlUrl: json['html_url'],
      followersUrl: json['followers_url'],
      followingUrl: json['following_url'],
      gistsUrl: json['gists_url'],
      starredUrl: json['starred_url'],
      subscriptionsUrl: json['subscriptions_url'],
      organizationsUrl: json['organizations_url'],
      reposUrl: json['repos_url'],
      eventsUrl: json['events_url'],
      receivedEventsUrl: json['received_events_url'],
      type: json['type'],
      siteAdmin: json['site_admin'],
    );
  }
}

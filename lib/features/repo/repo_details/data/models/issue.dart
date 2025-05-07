class Issue {
  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final User user;
  final List<dynamic> labels;
  final String state;
  final bool locked;
  final dynamic assignee;
  final List<dynamic> assignees;
  final dynamic milestone;
  final int comments;
  final String createdAt;
  final String updatedAt;
  final dynamic closedAt;
  final String authorAssociation;
  final SubIssuesSummary? subIssuesSummary;
  final dynamic activeLockReason;
  final String body;
  final dynamic closedBy;
  final Reactions? reactions;
  final String timelineUrl;
  final dynamic performedViaGithubApp;
  final dynamic stateReason;

  Issue({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignee,
    required this.assignees,
    required this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.authorAssociation,
    required this.subIssuesSummary,
    required this.activeLockReason,
    required this.body,
    required this.closedBy,
    required this.reactions,
    required this.timelineUrl,
    required this.performedViaGithubApp,
    required this.stateReason,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      url: json['url'],
      repositoryUrl: json['repository_url'],
      labelsUrl: json['labels_url'],
      commentsUrl: json['comments_url'],
      eventsUrl: json['events_url'],
      htmlUrl: json['html_url'],
      id: json['id'],
      nodeId: json['node_id'],
      number: json['number'],
      title: json['title'],
      user: User.fromJson(json['user']),
      labels: List<dynamic>.from(json['labels']),
      state: json['state'],
      locked: json['locked'],
      assignee: json['assignee'],
      assignees: List<dynamic>.from(json['assignees']),
      milestone: json['milestone'],
      comments: json['comments'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      closedAt: json['closed_at'],
      authorAssociation: json['author_association'],
      subIssuesSummary: json['sub_issues_summary'] != null ? SubIssuesSummary.fromJson(json['sub_issues_summary']) : null,
      activeLockReason: json['active_lock_reason'],
      body: json['body'] ?? '',
      closedBy: json['closed_by'],
      reactions: json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null,
      timelineUrl: json['timeline_url'],
      performedViaGithubApp: json['performed_via_github_app'],
      stateReason: json['state_reason'],
    );
  }

  static List<Issue> fromList(List<dynamic> json) {
    return json.map((issue) => Issue.fromJson(issue)).toList();
  }
}

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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

class SubIssuesSummary {
  final int total;
  final int completed;
  final int percentCompleted;

  SubIssuesSummary({
    required this.total,
    required this.completed,
    required this.percentCompleted,
  });

  factory SubIssuesSummary.fromJson(Map<String, dynamic> json) {
    return SubIssuesSummary(
      total: json['total'],
      completed: json['completed'],
      percentCompleted: json['percent_completed'],
    );
  }
}

class Reactions {
  final String url;
  final int totalCount;
  final int plusOne;
  final int minusOne;
  final int laugh;
  final int hooray;
  final int confused;
  final int heart;
  final int rocket;
  final int eyes;

  Reactions({
    required this.url,
    required this.totalCount,
    required this.plusOne,
    required this.minusOne,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
      url: json['url'],
      totalCount: json['total_count'],
      plusOne: json['+1'],
      minusOne: json['-1'],
      laugh: json['laugh'],
      hooray: json['hooray'],
      confused: json['confused'],
      heart: json['heart'],
      rocket: json['rocket'],
      eyes: json['eyes'],
    );
  }
}

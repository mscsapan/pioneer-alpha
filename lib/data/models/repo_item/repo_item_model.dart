// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/data/models/repo_item/owner_model.dart';

class RepoItemModel extends Equatable {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final String htmlUrl;
  final String description;
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
  final String createdAt;
  final String updatedAt;
  final String pushedAt;
  final String gitUrl;
  final String sshUrl;
  final String cloneUrl;
  final String svnUrl;
  final String homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String language;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool hasDiscussions;
  final int forksCount;
  final String mirrorUrl;
  final bool archived;
  final bool disabled;
  final int openIssuesCount;
  final bool allowForking;
  final bool isTemplate;
  final bool webCommitSignoffRequired;
  final String visibility;
  final int forks;
  final int openIssues;
  final int watchers;
  final String defaultBranch;
  final double score;
  final OwnerModel ? owner;
  final OwnerModel ? license;
  final List<String>? topics;
  const RepoItemModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.description,
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
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.hasDiscussions,
    required this.forksCount,
    required this.mirrorUrl,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    required this.allowForking,
    required this.isTemplate,
    required this.webCommitSignoffRequired,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    required this.score,
    required this.owner,
    required this.license,
    required this.topics,
  });

  RepoItemModel copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    String? mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
    double? score,
    OwnerModel ? owner,
    OwnerModel ? license,
    List<String>? topics,
  }) {
    return RepoItemModel(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      fork: fork ?? this.fork,
      url: url ?? this.url,
      forksUrl: forksUrl ?? this.forksUrl,
      keysUrl: keysUrl ?? this.keysUrl,
      collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
      teamsUrl: teamsUrl ?? this.teamsUrl,
      hooksUrl: hooksUrl ?? this.hooksUrl,
      issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      assigneesUrl: assigneesUrl ?? this.assigneesUrl,
      branchesUrl: branchesUrl ?? this.branchesUrl,
      tagsUrl: tagsUrl ?? this.tagsUrl,
      blobsUrl: blobsUrl ?? this.blobsUrl,
      gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
      gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
      treesUrl: treesUrl ?? this.treesUrl,
      statusesUrl: statusesUrl ?? this.statusesUrl,
      languagesUrl: languagesUrl ?? this.languagesUrl,
      stargazersUrl: stargazersUrl ?? this.stargazersUrl,
      contributorsUrl: contributorsUrl ?? this.contributorsUrl,
      subscribersUrl: subscribersUrl ?? this.subscribersUrl,
      subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
      commitsUrl: commitsUrl ?? this.commitsUrl,
      gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
      contentsUrl: contentsUrl ?? this.contentsUrl,
      compareUrl: compareUrl ?? this.compareUrl,
      mergesUrl: mergesUrl ?? this.mergesUrl,
      archiveUrl: archiveUrl ?? this.archiveUrl,
      downloadsUrl: downloadsUrl ?? this.downloadsUrl,
      issuesUrl: issuesUrl ?? this.issuesUrl,
      pullsUrl: pullsUrl ?? this.pullsUrl,
      milestonesUrl: milestonesUrl ?? this.milestonesUrl,
      notificationsUrl: notificationsUrl ?? this.notificationsUrl,
      labelsUrl: labelsUrl ?? this.labelsUrl,
      releasesUrl: releasesUrl ?? this.releasesUrl,
      deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      gitUrl: gitUrl ?? this.gitUrl,
      sshUrl: sshUrl ?? this.sshUrl,
      cloneUrl: cloneUrl ?? this.cloneUrl,
      svnUrl: svnUrl ?? this.svnUrl,
      homepage: homepage ?? this.homepage,
      size: size ?? this.size,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
      hasIssues: hasIssues ?? this.hasIssues,
      hasProjects: hasProjects ?? this.hasProjects,
      hasDownloads: hasDownloads ?? this.hasDownloads,
      hasWiki: hasWiki ?? this.hasWiki,
      hasPages: hasPages ?? this.hasPages,
      hasDiscussions: hasDiscussions ?? this.hasDiscussions,
      forksCount: forksCount ?? this.forksCount,
      mirrorUrl: mirrorUrl ?? this.mirrorUrl,
      archived: archived ?? this.archived,
      disabled: disabled ?? this.disabled,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      allowForking: allowForking ?? this.allowForking,
      isTemplate: isTemplate ?? this.isTemplate,
      webCommitSignoffRequired: webCommitSignoffRequired ?? this.webCommitSignoffRequired,
      visibility: visibility ?? this.visibility,
      forks: forks ?? this.forks,
      openIssues: openIssues ?? this.openIssues,
      watchers: watchers ?? this.watchers,
      defaultBranch: defaultBranch ?? this.defaultBranch,
      score: score ?? this.score,
      owner: owner ?? this.owner,
      license: license ?? this.license,
      topics: topics ?? this.topics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'private': private,
      'html_url': htmlUrl,
      'description': description,
      'fork': fork,
      'url': url,
      'forks_url': forksUrl,
      'keys_url': keysUrl,
      'collaborators_url': collaboratorsUrl,
      'teams_url': teamsUrl,
      'hooks_url': hooksUrl,
      'issue_events_url': issueEventsUrl,
      'events_url': eventsUrl,
      'assignees_url': assigneesUrl,
      'branches_url': branchesUrl,
      'tags_url': tagsUrl,
      'blobs_url': blobsUrl,
      'git_tags_url': gitTagsUrl,
      'git_refs_url': gitRefsUrl,
      'trees_url': treesUrl,
      'statuses_url': statusesUrl,
      'languages_url': languagesUrl,
      'stargazers_url': stargazersUrl,
      'contributors_url': contributorsUrl,
      'subscribers_url': subscribersUrl,
      'subscription_url': subscriptionUrl,
      'commits_url': commitsUrl,
      'git_commits_url': gitCommitsUrl,
      'comments_url': commentsUrl,
      'issue_comment_url': issueCommentUrl,
      'contents_url': contentsUrl,
      'compare_url': compareUrl,
      'merges_url': mergesUrl,
      'archive_url': archiveUrl,
      'downloads_url': downloadsUrl,
      'issues_url': issuesUrl,
      'pulls_url': pullsUrl,
      'milestones_url': milestonesUrl,
      'notifications_url': notificationsUrl,
      'labels_url': labelsUrl,
      'releases_url': releasesUrl,
      'deployments_url': deploymentsUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pushed_at': pushedAt,
      'git_url': gitUrl,
      'ssh_url': sshUrl,
      'clone_url': cloneUrl,
      'svn_url': svnUrl,
      'homepage': homepage,
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_downloads': hasDownloads,
      'has_wiki': hasWiki,
      'has_pages': hasPages,
      'has_discussions': hasDiscussions,
      'forks_count': forksCount,
      'mirror_url': mirrorUrl,
      'archived': archived,
      'disabled': disabled,
      'open_issues_count': openIssuesCount,
      'allow_forking': allowForking,
      'is_template': isTemplate,
      'web_commit_signoff_required': webCommitSignoffRequired,
      'visibility': visibility,
      'forks': forks,
      'open_issues': openIssues,
      'watchers': watchers,
      'default_branch': defaultBranch,
      'score': score,
      'owner': owner?.toMap(),
      'license': license?.toMap(),
      'topics': topics?.map((x) => x).toList(),
    };
  }

  factory RepoItemModel.fromMap(Map<String, dynamic> map) {
    return RepoItemModel(
      id: map['id'] ?? 0,
      nodeId: map['node_id'] ?? '',
      name: map['name'] ?? '',
      fullName: map['full_name'] ?? '',
      private: map['private'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      description: map['description'] ?? '',
      fork: map['fork'] ?? false,
      url: map['url'] ?? '',
      forksUrl: map['forks_url'] ?? '',
      keysUrl: map['keys_url'] ?? '',
      collaboratorsUrl: map['collaborators_url'] ?? '',
      teamsUrl: map['teams_url'] ?? '',
      hooksUrl: map['hooks_url'] ?? '',
      issueEventsUrl: map['issue_events_url'] ?? '',
      eventsUrl: map['events_url'] ?? '',
      assigneesUrl: map['assignees_url'] ?? '',
      branchesUrl: map['branches_url'] ?? '',
      tagsUrl: map['tags_url'] ?? '',
      blobsUrl: map['blobs_url'] ?? '',
      gitTagsUrl: map['git_tags_url'] ?? '',
      gitRefsUrl: map['git_refs_url'] ?? '',
      treesUrl: map['trees_url'] ?? '',
      statusesUrl: map['statuses_url'] ?? '',
      languagesUrl: map['languages_url'] ?? '',
      stargazersUrl: map['stargazers_url'] ?? '',
      contributorsUrl: map['contributors_url'] ?? '',
      subscribersUrl: map['subscribers_url'] ?? '',
      subscriptionUrl: map['subscription_url'] ?? '',
      commitsUrl: map['commits_url'] ?? '',
      gitCommitsUrl: map['git_commits_url'] ?? '',
      commentsUrl: map['comments_url'] ?? '',
      issueCommentUrl: map['issue_comment_url'] ?? '',
      contentsUrl: map['contents_url'] ?? '',
      compareUrl: map['compare_url'] ?? '',
      mergesUrl: map['merges_url'] ?? '',
      archiveUrl: map['archive_url'] ?? '',
      downloadsUrl: map['downloads_url'] ?? '',
      issuesUrl: map['issues_url'] ?? '',
      pullsUrl: map['pulls_url'] ?? '',
      milestonesUrl: map['milestones_url'] ?? '',
      notificationsUrl: map['notifications_url'] ?? '',
      labelsUrl: map['labels_url'] ?? '',
      releasesUrl: map['releases_url'] ?? '',
      deploymentsUrl: map['deployments_url'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      pushedAt: map['pushed_at'] ?? '',
      gitUrl: map['git_url'] ?? '',
      sshUrl: map['ssh_url'] ?? '',
      cloneUrl: map['clone_url'] ?? '',
      svnUrl: map['svn_url'] ?? '',
      homepage: map['homepage'] ?? '',
      size: map['size'] != null? int.parse(map['size'].toString()):0,
      stargazersCount: map['stargazers_count'] != null? int.parse(map['stargazers_count'].toString()):0,
      watchersCount: map['watchers_count'] != null? int.parse(map['watchers_count'].toString()):0,
      language: map['language'] ?? '',
      hasIssues: map['has_issues'] ?? false,
      hasProjects: map['has_projects'] ?? false,
      hasDownloads: map['has_downloads'] ?? false,
      hasWiki: map['has_wiki'] ?? false,
      hasPages: map['has_pages'] ?? false,
      hasDiscussions: map['has_discussions'] ?? false,
      forksCount: map['forks_count'] != null? int.parse(map['forks_count'].toString()):0,
      mirrorUrl: map['mirror_url'] ?? '',
      archived: map['archived'] ?? false,
      disabled: map['disabled'] ?? false,
      openIssuesCount: map['open_issues_count'] != null? int.parse(map['open_issues_count'].toString()):0,
      allowForking: map['allow_forking'] ?? false,
      isTemplate: map['is_template'] ?? false,
      webCommitSignoffRequired: map['web_commit_signoff_required'] ?? false,
      visibility: map['visibility'] ?? '',
      forks: map['forks'] != null? int.parse(map['forks'].toString()):0,
      openIssues: map['open_issues'] != null? int.parse(map['open_issues'].toString()):0,
      watchers: map['watchers'] != null? int.parse(map['watchers'].toString()):0,
      defaultBranch: map['default_branch'] ?? '',
      score: map['score'] != null? double.parse(map['score'].toString()):0.0,
      owner: map['owner'] != null ? OwnerModel .fromMap(map['owner'] as Map<String,dynamic>) : null,
      license: map['license'] != null ? OwnerModel .fromMap(map['license'] as Map<String,dynamic>) : null,
      topics: map['topics'] != null ? List<String>.from((map['topics'] as List<dynamic>)) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoItemModel.fromJson(String source) => RepoItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nodeId,
      name,
      fullName,
      private,
      htmlUrl,
      description,
      fork,
      url,
      forksUrl,
      keysUrl,
      collaboratorsUrl,
      teamsUrl,
      hooksUrl,
      issueEventsUrl,
      eventsUrl,
      assigneesUrl,
      branchesUrl,
      tagsUrl,
      blobsUrl,
      gitTagsUrl,
      gitRefsUrl,
      treesUrl,
      statusesUrl,
      languagesUrl,
      stargazersUrl,
      contributorsUrl,
      subscribersUrl,
      subscriptionUrl,
      commitsUrl,
      gitCommitsUrl,
      commentsUrl,
      issueCommentUrl,
      contentsUrl,
      compareUrl,
      mergesUrl,
      archiveUrl,
      downloadsUrl,
      issuesUrl,
      pullsUrl,
      milestonesUrl,
      notificationsUrl,
      labelsUrl,
      releasesUrl,
      deploymentsUrl,
      createdAt,
      updatedAt,
      pushedAt,
      gitUrl,
      sshUrl,
      cloneUrl,
      svnUrl,
      homepage,
      size,
      stargazersCount,
      watchersCount,
      language,
      hasIssues,
      hasProjects,
      hasDownloads,
      hasWiki,
      hasPages,
      hasDiscussions,
      forksCount,
      mirrorUrl,
      archived,
      disabled,
      openIssuesCount,
      allowForking,
      isTemplate,
      webCommitSignoffRequired,
      visibility,
      forks,
      openIssues,
      watchers,
      defaultBranch,
      score,
      owner,
      license,
      topics,
    ];
  }
}

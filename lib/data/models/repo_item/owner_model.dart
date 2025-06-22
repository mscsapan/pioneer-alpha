// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../logic/cubit/repo_search/repo_search_cubit.dart';

// ignore: must_be_immutable
class OwnerModel extends Equatable {
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
  final String key;
  final String name;
  final String spdxId;
  final String noteId;


  final String userViewType;
   int initialPage;
   int perPage;
   bool isListEmpty;
   bool siteAdmin;
   bool isDescending;
  final SortBy sortBy;
  final RepoSearchState repoState;

   OwnerModel({
    this.login = '',
    this.id = 0,
    this.nodeId = '',
    this.avatarUrl = '',
    this.gravatarId = '',
    this.url = '',
    this.htmlUrl = '',
    this.followersUrl = '',
    this.followingUrl = '',
    this.gistsUrl = '',
    this.starredUrl = '',
    this.subscriptionsUrl = '',
    this.organizationsUrl = '',
    this.reposUrl = '',
    this.eventsUrl = '',
    this.receivedEventsUrl = '',
    this.type = '',
    this.key = '',
    this.name = '',
    this.spdxId = '',
    this.noteId = '',
    this.userViewType = '',
    this.initialPage = 1,
    this.perPage = 50,
    this.isListEmpty = false,
    this.siteAdmin = true,
    this.isDescending = true,
    this.sortBy = SortBy.stars,
    this.repoState = const RepoSearchInitial(),
  });

  OwnerModel copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    String? key,
    String? name,
    String? spdxId,
    String? noteId,
    String? userViewType,
    int? initialPage,
    int? perPage,
    bool? isListEmpty,
    bool? siteAdmin,
    bool? isDescending,
    SortBy? sortBy,
    RepoSearchState? repoState,
  }) {
    return OwnerModel(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      key: key ?? this.key,
      name: name ?? this.name,
      spdxId: spdxId ?? this.spdxId,
      noteId: noteId ?? this.noteId,
      userViewType: userViewType ?? this.userViewType,
      initialPage: initialPage ?? this.initialPage,
      isListEmpty: isListEmpty ?? this.isListEmpty,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      isDescending: isDescending ?? this.isDescending,
      sortBy: sortBy ?? this.sortBy,
      repoState: repoState ?? this.repoState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'gravatar_id': gravatarId,
      'url': url,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'user_view_type': userViewType,
      'site_admin': siteAdmin,
    };
  }

  factory OwnerModel.fromMap(Map<String, dynamic> map) {
    return OwnerModel(
      login: map['login'] ?? '',
      id: map['id'] != null ? int.parse(map['id'].toString()) : 0,
      nodeId: map['node_id'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      gravatarId: map['gravatar_id'] ?? '',
      url: map['url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      followersUrl: map['followers_url'] ?? '',
      followingUrl: map['following_url'] ?? '',
      gistsUrl: map['gists_url'] ?? '',
      starredUrl: map['starred_url'] ?? '',
      subscriptionsUrl: map['subscriptions_url'] ?? '',
      organizationsUrl: map['organizations_url'] ?? '',
      reposUrl: map['repos_url'] ?? '',
      eventsUrl: map['events_url'] ?? '',
      receivedEventsUrl: map['received_events_url'] ?? '',
      type: map['type'] ?? '',
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      spdxId: map['spdx_id'] ?? '',
      noteId: map['note_id'] ?? '',
      userViewType: map['user_view_type'] ?? '',
      siteAdmin: map['site_admin'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnerModel.fromJson(String source) =>
      OwnerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      key,
      name,
      spdxId,
      noteId,
      userViewType,
      initialPage,
      perPage,
      isListEmpty,
      siteAdmin,
      isDescending,
      sortBy,
      repoState,
    ];
  }
}

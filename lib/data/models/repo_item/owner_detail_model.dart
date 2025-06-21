// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OwnerDetail extends Equatable {
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
  final String userViewType;
  final bool siteAdmin;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final bool hireable;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final String createdAt;
  final String updatedAt;
  const OwnerDetail({
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
    required this.userViewType,
    required this.siteAdmin,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  OwnerDetail copyWith({
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
    String? userViewType,
    bool? siteAdmin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    bool? hireable,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
  }) {
    return OwnerDetail(
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
      userViewType: userViewType ?? this.userViewType,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
    'login' : login,
    'id' : id,
    'node_id' : nodeId,
    'avatar_url' : avatarUrl,
    'gravatar_id' : gravatarId,
    'url' : url,
    'html_url' : htmlUrl,
    'followers_url' : followersUrl,
    'following_url' : followingUrl,
    'gists_url' : gistsUrl,
    'starred_url' : starredUrl,
    'subscriptions_url' : subscriptionsUrl,
    'organizations_url' : organizationsUrl,
    'repos_url' : reposUrl,
    'events_url' : eventsUrl,
    'received_events_url' : receivedEventsUrl,
    'type' : type,
    'user_view_type' : userViewType,
    'site_admin' : siteAdmin,
    'name' : name,
    'company' : company,
    'blog' : blog,
    'location' : location,
    'email' : email,
    'hireable' : hireable,
    'bio' : bio,
    'twitter_username' : twitterUsername,
    'public_repos' : publicRepos,
    'public_gists' : publicGists,
    'followers' : followers,
    'following' : following,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    };
  }

  factory OwnerDetail.fromMap(Map<String, dynamic> map) {
    return OwnerDetail(
      login: map['login'] ?? '',
      id: map['id'] as int,
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
      userViewType: map['user_view_type'] ?? '',
      siteAdmin: map['site_admin'] ?? false,
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      blog: map['blog'] ?? '',
      location: map['location'] ?? '',
      email: map['email'] ?? '',
      hireable: map['hireable']?? false,
      bio: map['bio'] ?? '',
      twitterUsername: map['twitter_username'] ?? '',
      publicRepos: map['public_repos'] != null? int.parse(map['public_repos'].toString()):0,
      publicGists: map['public_gists'] != null? int.parse(map['public_gists'].toString()):0,
      followers: map['followers'] != null? int.parse(map['followers'].toString()):0,
      following: map['following'] != null? int.parse(map['following'].toString()):0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnerDetail.fromJson(String source) => OwnerDetail.fromMap(json.decode(source) as Map<String, dynamic>);

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
      userViewType,
      siteAdmin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
      bio,
      twitterUsername,
      publicRepos,
      publicGists,
      followers,
      following,
      createdAt,
      updatedAt,
    ];
  }
}

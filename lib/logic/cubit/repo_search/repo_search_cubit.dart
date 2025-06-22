import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/data_provider/remote_url.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/repo_item/owner_detail_model.dart';
import '../../../data/models/repo_item/owner_model.dart';
import '../../../data/models/repo_item/repo_item_model.dart';
import '../../repository/repo_item_repository.dart';

part 'repo_search_state.dart';

class RepoSearchCubit extends Cubit<OwnerModel> {

  final RepoItemRepository _repository;

  RepoSearchCubit({required RepoItemRepository repository})
      : _repository = repository,
        super(OwnerModel());

  bool isDescending = true;

  List<RepoItemModel> ? repositories = [];

  List<RepoItemModel> ? tempRepos = [];

  OwnerDetail ? detail;

  void addType(String name)=>emit(state.copyWith(userViewType: name));


  Future<void> getRepoSearchList() async {
    debugPrint('called getRepoSearchList');
    final url = Uri.parse(RemoteUrls.repoList).replace(queryParameters: {
      'q': 'flutter',
      'per_page': state.perPage.toString(),
      'sort': 'stars',
      'order': 'desc'
    });

    debugPrint('url $url');
    emit(state.copyWith(repoState: const RepoSearchLoading()));

    final result = await _repository.getRepoItems(url);
    result.fold(
          (failure) {
        final error = RepoSearchError(failure.message, failure.statusCode);
        emit(state.copyWith(repoState: error));
      },
          (success) async {
        repositories = success;

        final prefs = await SharedPreferences.getInstance();

        final jsonList = repositories?.map((e) => e.toJson()).toList();

        await prefs.setString('cached_repos', jsonEncode(jsonList));

        final loaded = RepoSearchLoaded(repositories);
        emit(state.copyWith(repoState: loaded));
      },
    );
  }

  Future<void> getRepoSearchListFromCache() async {

    // debugPrint('called getRepoSearchListFromCache');
    // emit(state.copyWith(repoState: const RepoSearchLoading()));

    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('cached_repos');

    if (jsonString != null) {

      final decoded = jsonDecode(jsonString) as List;

      repositories = decoded.map((json) => RepoItemModel.fromJson(json)).toList();

      // final imgs = repositories?.map((e) => e.owner?.avatarUrl).toList();
      // debugPrint('caches imgs: $imgs');

      final loaded = RepoSearchLoaded(repositories);
      emit(state.copyWith(repoState: loaded));
    } else {
      emit(state.copyWith(repoState: RepoSearchError('No cached data found', 404)));
    }
  }


  Future<void> loadOnlineOfflineRepo() async {
    final prefs = await SharedPreferences.getInstance();
    final hasCache = prefs.containsKey('cached_repos');

    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternet = !connectivityResult.contains(ConnectivityResult.none);

    if (!hasInternet) {
      // debugPrint('no internet and have already cached data');
      await getRepoSearchListFromCache();
    } else if (hasCache) {
      // debugPrint('have internet and have already cached data');
      await getRepoSearchListFromCache();
    } else {
      // debugPrint('have internet and have not cached data');
      await getRepoSearchList();
    }
  }


  void sortRepos(SortBy sortBy) {
    if (repositories == null || (repositories?.isEmpty??false)) return;

    isDescending = !isDescending;

    tempRepos = List<RepoItemModel>.from(repositories??[]);
    tempRepos?.sort((a, b) {
      int comparison;
      if (sortBy == SortBy.stars) {
        comparison = a.stargazersCount.compareTo(b.stargazersCount);
        //final starFilter = tempRepos?.map((e)=>e.stargazersCount).toList();
        // debugPrint('starFilter $starFilter');
      } else {
        comparison = a.updatedAt.compareTo(b.updatedAt);
        //final updateFilter = tempRepos?.map((e)=>e.updatedAt).toList();
        // debugPrint('updateFilter $updateFilter');
      }
      return isDescending ? -comparison : comparison;
    });

    emit(state.copyWith(sortBy: sortBy,repoState: RepoSearchLoaded(tempRepos)));
  }



  Future<void> getOwnerDetail() async {

    final url = Uri.parse(RemoteUrls.detail(state.userViewType));
    debugPrint('url $url');

    emit(state.copyWith(repoState: const RepoSearchDetailLoading()));

    final result = await _repository.getOwnerDetails(url);
    result.fold(
          (failure) {
        final error = RepoSearchDetailError(failure.message, failure.statusCode);
        emit(state.copyWith(repoState: error));
      },
          (success) {
            detail = success;
            final loaded = RepoSearchDetailLoaded(success);
            emit(state.copyWith(repoState: loaded));
      },
    );
  }


  void initPage() {
    emit(state.copyWith(initialPage: 1, isListEmpty: false));
  }
}

enum SortBy { stars, updated }

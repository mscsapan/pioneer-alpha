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

  List<RepoItemModel> ? repositories = [];

  List<RepoItemModel> ? tempRepos = [];

  OwnerDetail ? detail;

  void addType(String name)=>emit(state.copyWith(userViewType: name));

  void addConnectionType(bool value)=>emit(state.copyWith(siteAdmin: value));

  void addOwner(RepoItemModel? repoItem)=>emit(state.copyWith(repoItem: repoItem));



  Future<void> getRepoSearchList() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternet = !connectivityResult.contains(ConnectivityResult.none);

    if(hasInternet){
      //debugPrint('called getRepoSearchList');
      final url = Uri.parse(RemoteUrls.repoList).replace(queryParameters: {
        'q': 'flutter',
        'per_page': state.perPage.toString(),
        'sort': 'stars',
        'order': 'desc'
      });

      //debugPrint('url $url');
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

          await prefs.remove('cached_repos');

          await prefs.setString('cached_repos', jsonEncode(jsonList));

          final loaded = RepoSearchLoaded(repositories);
          emit(state.copyWith(repoState: loaded));
        },
      );
    }else{
      final error = RepoSearchError('No Internet connection', 10061);
      emit(state.copyWith(repoState: error));
      //debugPrint('no internet');
    }
  }

  Future<void> getRepoSearchListFromCache() async {

    // debugPrint('called getRepoSearchListFromCache');
    // emit(state.copyWith(repoState: const RepoSearchLoading()));

    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('cached_repos');

    final cacheDescending = prefs.getBool('sort_by_star') ?? true;

    final cacheUpdated = prefs.getBool('sort_by_updated') ?? false;

    final updatedAt = cacheUpdated ? SortBy.updated : SortBy.stars;

    //debugPrint('cacheDescending: $cacheDescending, updatedAt: $updatedAt');

    if (jsonString != null) {

      final decoded = jsonDecode(jsonString) as List;

      repositories = decoded.map((json) => RepoItemModel.fromJson(json)).toList();

      // final imgs = repositories?.map((e) => e.owner?.avatarUrl).toList();
      // debugPrint('caches imgs: $imgs');

      // final loaded = RepoSearchLoaded(repositories);
      // emit(state.copyWith(isDescending: cacheDescending, sortBy: updatedAt ,repoState: loaded));

      emit(state.copyWith(isDescending: cacheDescending, sortBy: updatedAt));

      sortRepos(updatedAt);
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


  void sortRepos(SortBy sortBy, {bool toggle = false}) {
    if (repositories == null || (repositories?.isEmpty ?? false)) return;

    final newDescending = toggle ? !state.isDescending : state.isDescending;

    tempRepos = List<RepoItemModel>.from(repositories ?? []);

    tempRepos?.sort((a, b) {
      int comparison;
      if (sortBy == SortBy.stars) {
        comparison = a.stargazersCount.compareTo(b.stargazersCount);
      } else {
        comparison = a.updatedAt.compareTo(b.updatedAt);
      }
      return newDescending ? -comparison : comparison;
    });

    emit(state.copyWith(isDescending: newDescending, sortBy: sortBy, repoState: RepoSearchLoaded(tempRepos)));

    storeCachedSort();
  }

  Future<void> storeCachedSort()async{

    final prefs = await SharedPreferences.getInstance();

    final isUpdated = state.sortBy == SortBy.updated;

     prefs..setBool('sort_by_star', state.isDescending)..setBool('sort_by_updated', isUpdated);
  }

  void initPage() {
    emit(state.copyWith(initialPage: 1, isListEmpty: false));
  }

  void initState() async{

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('sort_by_star');

    await prefs.remove('sort_by_updated');

    emit(state.copyWith(isDescending: true,sortBy: SortBy.stars,repoState: RepoSearchInitial()));
  }

}

enum SortBy { stars, updated }

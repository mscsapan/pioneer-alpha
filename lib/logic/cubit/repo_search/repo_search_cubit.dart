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
  OwnerDetail ? detail;

  void addType(String name)=>emit(state.copyWith(userViewType: name));

  Future<void> getRepoSearchList() async {

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
          (success) {
          repositories = success;
          final loaded = RepoSearchLoaded(repositories);
          emit(state.copyWith(repoState: loaded));

      },
    );
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

part of 'repo_search_cubit.dart';

sealed class RepoSearchState extends Equatable {
  const RepoSearchState();

  @override
  List<Object?> get props => [];
}

final class RepoSearchInitial extends RepoSearchState {
  const RepoSearchInitial();
}


final class RepoSearchLoading extends RepoSearchState {
  const RepoSearchLoading();
}

final class RepoSearchError extends RepoSearchState {
  final String message;
  final int statusCode;

  const RepoSearchError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}


class RepoSearchLoaded extends RepoSearchState {
  final List<RepoItemModel> ? repositories;

  const RepoSearchLoaded(this.repositories);

  @override
  List<Object?> get props => [repositories];
}

// class RepoSearchMoreLoaded extends RepoSearchState {
//   final List<RepoItemModel> ? quotes;
//
//   const RepoSearchMoreLoaded(this.quotes);
//
//   @override
//   List<Object?> get props => [quotes];
// }

final class RepoSearchDetailLoading extends RepoSearchState {
  const RepoSearchDetailLoading();
}

final class RepoSearchDetailError extends RepoSearchState {
  final String message;
  final int statusCode;

  const RepoSearchDetailError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class RepoSearchDetailLoaded extends RepoSearchState {
  final OwnerDetail ? detail;

  const RepoSearchDetailLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

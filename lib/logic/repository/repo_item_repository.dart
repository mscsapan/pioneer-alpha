import 'package:dartz/dartz.dart';

import '../../data/data_provider/remote_data_source.dart';
import '../../data/models/repo_item/owner_detail_model.dart';
import '../../data/models/repo_item/repo_item_model.dart';
import '../../presentation/errors/exception.dart';
import '../../presentation/errors/failure.dart';

abstract class RepoItemRepository {
  Future<Either<Failure, List<RepoItemModel>>> getRepoItems(Uri uri);

  Future<Either<Failure, OwnerDetail>> getOwnerDetails(Uri uri);

}

class RepoItemRepositoryImpl implements RepoItemRepository {
  final RemoteDataSource remoteDataSources;
  RepoItemRepositoryImpl({required this.remoteDataSources});

  @override
  Future<Either<Failure, List<RepoItemModel>>> getRepoItems(Uri uri) async {
    try {
      final result = await remoteDataSources.getRepoItems(uri);

      final dataList = result['items'];

      final data = List<RepoItemModel>.from(dataList.map((e) => RepoItemModel.fromMap(e))).toList();

      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, OwnerDetail>> getOwnerDetails(Uri uri) async {
    try {
      final result = await remoteDataSources.getRepoItems(uri);

      final data =  OwnerDetail.fromMap(result);

      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
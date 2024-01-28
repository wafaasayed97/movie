import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:movie/tvs/domain/entities/tv_entity.dart';
import 'package:movie/tvs/domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository{
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure,List<Tv>>> getOnTheAir() async{
    final result = await baseTvRemoteDataSource.getOnTheAirTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async{
    final result = await baseTvRemoteDataSource.getPopularTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv()async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



}
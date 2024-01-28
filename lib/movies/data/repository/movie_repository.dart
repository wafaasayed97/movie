import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../core/error/failure.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMoviesDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetail(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}

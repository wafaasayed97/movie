import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/recommendations.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_recommendations_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMoviesDetails(MovieDetailsParameters parameters);

  Future<Either<Failure,List<Recommendations>>> getRecommendations(RecommendationsParameters parameters);
}

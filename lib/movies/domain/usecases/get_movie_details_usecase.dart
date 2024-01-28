import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/base_use_case/base_usecase.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';

class GetMoviesDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMoviesDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMoviesDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

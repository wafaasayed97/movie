import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import '../../../core/base_use_case/base_usecase.dart';
import '../../../core/error/failure.dart';

class GetPopularUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}

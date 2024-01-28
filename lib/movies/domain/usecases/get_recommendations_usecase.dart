import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/base_use_case/base_usecase.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';

import '../entities/recommendations.dart';

class GetRecommendationsUseCase extends BaseUseCase<List<Recommendations>,RecommendationsParameters> {
   final BaseMovieRepository baseMovieRepository;

  GetRecommendationsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationsParameters parameters)async {
    return await baseMovieRepository.getRecommendations(parameters);
  }

}
class RecommendationsParameters extends Equatable{
  final int id ;

  const RecommendationsParameters(this.id);

  @override
  List<Object?> get props => [id];

}
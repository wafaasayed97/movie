import 'package:dartz/dartz.dart';
import 'package:movie/tvs/domain/entities/tv_entity.dart';
import 'package:movie/tvs/domain/repository/base_tv_repository.dart';

import '../../../core/error/failure.dart';

class GetOnTheAirTVUseCase {
  final BaseTvRepository baseTvRepository;

  GetOnTheAirTVUseCase(this.baseTvRepository);

  Future<Either<Failure,List<Tv>>> execute()async{
    return await baseTvRepository.getOnTheAir();
  }
}
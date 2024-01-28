import 'package:dartz/dartz.dart';
import 'package:movie/tvs/domain/entities/tv_entity.dart';
import 'package:movie/tvs/domain/repository/base_tv_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedTVUseCase {
  final BaseTvRepository baseTvRepository;

  GetTopRatedTVUseCase(this.baseTvRepository);

  Future<Either<Failure,List<Tv>>> execute()async{
    return await baseTvRepository.getTopRatedTv();
  }
}
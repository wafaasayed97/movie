import 'package:dartz/dartz.dart';
import 'package:movie/tvs/domain/repository/base_tv_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/tv_entity.dart';

class GetPopularTVUseCase{
  final BaseTvRepository baseTvRepository;

  GetPopularTVUseCase(this.baseTvRepository);

  Future<Either<Failure,List<Tv>>>execute()async{
    return await baseTvRepository.getPopularTv();
  }
}
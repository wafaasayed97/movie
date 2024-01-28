import 'package:dartz/dartz.dart';
import 'package:movie/tvs/domain/entities/tv_entity.dart';

import '../../../core/error/failure.dart';

abstract class BaseTvRepository {
  Future<Either<Failure,List<Tv>>> getOnTheAir();
  Future<Either<Failure,List<Tv>>> getPopularTv();
  Future<Either<Failure,List<Tv>>>getTopRatedTv();
}
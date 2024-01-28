import 'package:dio/dio.dart';
import 'package:movie/core/utils/app_constance.dart';
import 'package:movie/tvs/data/models/tv_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseTvRemoteDataSource{
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
}


class TvRemoteDataSource extends BaseTvRemoteDataSource{
  Future<List<TvModel>> getOnTheAirTv()async{
    final response = await Dio().get(AppConstance.onTheAirTvUrl);

    if(response.statusCode ==200){
      return List<TvModel>.from((response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }

  }

  @override
  Future<List<TvModel>> getPopularTv()async {
    final response = await Dio().get(AppConstance.popularTvUrl);

    if(response.statusCode ==200){
      return List<TvModel>.from((response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv()async {
    final response = await Dio().get(AppConstance.topRatedTvUrl);

    if(response.statusCode ==200){
      return List<TvModel>.from((response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
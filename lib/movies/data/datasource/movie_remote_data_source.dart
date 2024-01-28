import 'package:dio/dio.dart';

import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/network/error_message_model.dart';
import 'package:movie/core/utils/app_constance.dart';

import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../models/recommendations_model.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future <MovieDetailsModel>getMovieDetail(MovieDetailsParameters parameters);
  Future <List <RecommendationsModel>>getRecommendations(RecommendationsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async{
    final response = await Dio().get(AppConstance.popularMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie()async {
    final response = await Dio().get(AppConstance.topRateMoviesdUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(MovieDetailsParameters parameters)async {
    final response = await Dio().get(AppConstance.moviesDetailedPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(RecommendationsParameters parameters)async {
    final response = await Dio().get(AppConstance.recommendationsPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((e) => RecommendationsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}

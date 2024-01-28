import 'package:get_it/get_it.dart';
import 'package:movie/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movie_repository.dart';
import '../../movies/domain/repository/base_movie_repository.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';
import '../../movies/domain/usecases/get_popular_usecase.dart';
import '../../movies/domain/usecases/get_recommendations_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_usecase.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';
import '../../movies/presentation/controller/movies_bloc.dart';
import '../../tvs/data/datasource/tv_remote_data_source.dart';
import '../../tvs/data/repository/tv_repository.dart';
import '../../tvs/domain/repository/base_tv_repository.dart';
import '../../tvs/domain/usecases/get_on_the_air_tv.dart';
import '../../tvs/domain/usecases/get_popular_tv_usecase.dart';
import '../../tvs/domain/usecases/get_top_rated_tv_usecase.dart';
import '../../tvs/presentation/controller/tv_bloc.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Movie BLOC
    servicesLocator.registerFactory(() =>
        MoviesBloc(servicesLocator(), servicesLocator(), servicesLocator()));
    servicesLocator.registerFactory(
        () => MovieDetailsBloc(servicesLocator(), servicesLocator()));

    ///TV Bloc
    servicesLocator.registerFactory(() => TvBloc(servicesLocator()));

    ///Movies USE CASE
    servicesLocator
        .registerLazySingleton(() => GetNowPlayingUseCase(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetPopularUseCase(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetTopRatedUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(
        () => GetMoviesDetailsUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(
        () => GetRecommendationsUseCase(servicesLocator()));

    ///TV USE CASE
    servicesLocator
        .registerLazySingleton(() => GetOnTheAirTVUseCase(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetPopularTVUseCase(servicesLocator()));
    servicesLocator
        .registerLazySingleton(() => GetTopRatedTVUseCase(servicesLocator()));

    ///Movie DATA SOURCE
    servicesLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    ///Tv DATA SOURCE
    servicesLocator.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    ///Movie REPOSITORY
    servicesLocator.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(servicesLocator()));

    ///Tv REPOSITORY
    servicesLocator.registerLazySingleton<BaseTvRepository>(
        () => TvRepository(servicesLocator()));
  }
}

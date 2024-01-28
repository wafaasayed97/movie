import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';
import 'package:movie/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../core/utils/enums.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationsUseCase recommendationsUseCase;

  MovieDetailsBloc(this.getMoviesDetailsUseCase,this.recommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationEvent>(_getRecommendation);
  }


  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMoviesDetailsUseCase(
        MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.message,
            movieDetailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded,
            movieDetails: r)));
  }

  FutureOr<void> _getRecommendation(GetRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result = await recommendationsUseCase(
        RecommendationsParameters( event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationMessage: l.message,
                recommendationState: RequestState.error)),
            (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded
            )));

  }
}

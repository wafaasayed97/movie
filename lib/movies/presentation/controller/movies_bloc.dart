import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie/movies/domain/usecases/get_popular_usecase.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movie/movies/presentation/controller/movies_event.dart';
import 'package:movie/movies/presentation/controller/movies_state.dart';

import '../../../core/base_use_case/base_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MoviesBloc(this.getNowPlayingUseCase, this.getPopularUseCase,
      this.getTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase( const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingMessage: l.message, nowPlayingState: RequestState.error)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovie: r)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            popularMessage: l.message, popularState: RequestState.error)),
        (r) => emit(state.copyWith(
            popularMovie: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            topRatedMessage: l.message, topRatedState: RequestState.error)),
        (r) => emit(state.copyWith(
            topRatedMovie: r, topRatedState: RequestState.loaded)));
  }
}

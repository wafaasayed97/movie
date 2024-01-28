import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',

    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
     List<Movie>? nowPlayingMovie,
     RequestState ? nowPlayingState,
     String? nowPlayingMessage,

     List<Movie>? popularMovie,
     RequestState? popularState,
     String? popularMessage,

     List<Movie> ?topRatedMovie,
     RequestState? topRatedState,
     String? topRatedMessage,
}){
    return MoviesState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState??this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage??this.nowPlayingMessage,

      popularMovie: popularMovie??this.popularMovie,
      popularState: popularState??this.popularState,
      popularMessage: popularMessage??this.popularMessage,

      topRatedMovie: topRatedMovie??this.topRatedMovie,
      topRatedState: topRatedState??this.topRatedState,
      topRatedMessage: topRatedMessage??this.topRatedMessage,

    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,

        popularMovie,
        popularMessage,
        popularState,

        topRatedMovie,
        topRatedMessage,
        topRatedState
      ];
}

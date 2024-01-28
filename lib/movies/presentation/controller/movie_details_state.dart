part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;

  final RequestState recommendationState;
  final List<Recommendations> recommendation;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetails,
    this.movieDetailsMessage = '',

    this.recommendationState = RequestState.loading,
    this.recommendation= const [],
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    MovieDetails? movieDetails,
    String? movieDetailsMessage,

    RequestState? recommendationState,
    List<Recommendations>? recommendation,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,

      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        movieDetailsMessage,
        recommendationMessage,
        recommendation,
        recommendationState
      ];
}

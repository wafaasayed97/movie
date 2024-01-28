import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final int runTime;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetails(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.runTime,
      required this.genres,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        title,
        runTime,
        voteAverage,
        genres
      ];
}

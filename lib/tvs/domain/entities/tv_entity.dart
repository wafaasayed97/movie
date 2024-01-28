import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String firstAirDate;
  final double voteAverage;

  const Tv(
      {required this.id,
      required this.name,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.firstAirDate,
      required this.voteAverage});

  @override
  List<Object?> get props => [id, name,backdropPath,genreIds,overview, voteAverage,firstAirDate];
}

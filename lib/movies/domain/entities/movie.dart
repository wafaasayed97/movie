import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overView;
  final List<int> genreIds;
  final String backDropPath;
  final double voteAverage;
  final String releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.overView,
      required this.genreIds,
      required this.backDropPath,
      required this.releaseDate,
      required this.voteAverage});

  @override
  List<Object> get props =>
      [id, title, backDropPath, overView, voteAverage, genreIds,releaseDate];
}

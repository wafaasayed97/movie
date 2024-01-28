import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.overView,
      required super.genreIds,
      required super.backDropPath,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      overView: json['overview'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      backDropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble()
  );
}

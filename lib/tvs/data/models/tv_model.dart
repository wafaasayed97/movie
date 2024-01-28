import '../../domain/entities/tv_entity.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.id,
      required super.name,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.firstAirDate,
      required super.voteAverage});

  factory TvModel.fromJson(Map<String , dynamic> json)=>
      TvModel(
          id: json['id'],
          name: json['name'],
          backdropPath:json ['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
          overview: json['overview'],
          firstAirDate: json['first_air_date'],
          voteAverage: json['vote_average'].toDouble());
}

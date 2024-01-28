

import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.runTime,
      required super.genres,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic>json)=>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          id:json['id'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          title: json['title'],
          runTime: json['runtime'],
          genres: List.from(json['genres'].map((x)=>GenresModel.fromJson(x))),
          voteAverage: json['vote_average'].toDouble()
      );

}

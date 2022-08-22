import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/movie/data/models/movie_genres_model.dart';
import 'package:movie_app/movie/domain/entities/movie_details_entity.dart';

import '../../../core/utils/urls.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.genres,
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
    required super.voteCount,
  });

  factory MovieDetailsModel.formJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        genres: List<MovieGenresModel>.from(
            json['genres'].map((e) => MovieGenresModel.formJson(e))),
        backdropPath: json['backdrop_path'] ?? AppConstants.defaultImage,
        overview: json['overview'],
        posterPath: Urls.imageUrl(json['poster_path']),
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        runtime: json['runtime'],
      );
}

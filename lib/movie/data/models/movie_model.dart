import 'package:movie_app/core/utils/urls.dart';
import 'package:movie_app/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.genreIds,
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.formJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        genreIds: json['genre_ids'],
        backdropPath: Urls.imageUrl(json['backdrop_path']),
        overview: json['overview'],
        posterPath: Urls.imageUrl(json['poster_path']),
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}

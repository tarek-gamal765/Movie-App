import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/tv/data/models/tv_genres_model.dart';
import '../../domain/entities/tv_details_entity.dart';

class TvDetailsModel extends TvDetailsEntity {
  const TvDetailsModel({
    required super.id,
    required super.genres,
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.name,
    required super.firstAirDate,
    required super.lastAirDate,
    required super.voteAverage,
    required super.type,
    required super.voteCount,
  });

  factory TvDetailsModel.formJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        genres: List<TvGenresModel>.from(
            json['genres'].map((e) => TvGenresModel.formJson(e))),
        backdropPath: json['backdrop_path'] ?? AppConstants.defaultImage,
        overview: json['overview'],
        posterPath: json['poster_path'] ?? AppConstants.defaultImage,
        name: json['name'],
        firstAirDate: json['first_air_date'],
        lastAirDate: json['last_air_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        type: json['type'],
      );
}

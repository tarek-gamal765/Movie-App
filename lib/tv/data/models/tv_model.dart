import '../../../core/utils/app_constants.dart';
import '../../domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  const TvModel({
    required super.id,
    required super.genreIds,
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.name,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvModel.formJson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        genreIds: json['genre_ids'],
        backdropPath: json['backdrop_path'] ?? AppConstants.defaultImage,
        overview: json['overview'],
        posterPath: json['poster_path'],
        name: json['name'],
        firstAirDate: json['first_air_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}

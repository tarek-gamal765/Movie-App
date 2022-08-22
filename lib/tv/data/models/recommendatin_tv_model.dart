import '../../domain/entities/recommendation_tv_entity.dart';

class RecommendationTvModel extends RecommendationTvEntity {
  const RecommendationTvModel({
    required super.id,
    required super.posterPath,
    required super.overview,
    required super.name,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory RecommendationTvModel.fromJson(Map<String, dynamic> json) =>
      RecommendationTvModel(
        id: json['id'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        name: json['name'],
        firstAirDate: json['first_air_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}

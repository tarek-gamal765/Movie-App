import 'package:movie_app/movie/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
    required super.id,
    required super.posterPath,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        posterPath: json['poster_path'],

        overview: json['overview'],
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}

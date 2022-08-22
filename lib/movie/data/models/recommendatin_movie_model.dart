
import '../../domain/entities/recommendation_movie_entity.dart';

class RecommendationMovieModel extends RecommendationMovieEntity {
  const RecommendationMovieModel({
    required super.id,
    required super.posterPath,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory RecommendationMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommendationMovieModel(
        id: json['id'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}

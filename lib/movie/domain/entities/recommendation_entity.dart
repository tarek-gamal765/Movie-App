import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final int id;
  final String? posterPath;
  final String overview;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  const RecommendationEntity({
    required this.id,
    required this.posterPath,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        overview,
        title,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}

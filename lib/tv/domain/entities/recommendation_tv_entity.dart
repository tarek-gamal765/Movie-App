import 'package:equatable/equatable.dart';

class RecommendationTvEntity extends Equatable {
  final int id;
  final String? posterPath;
  final String overview;
  final String name;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;

  const RecommendationTvEntity({
    required this.id,
    required this.posterPath,
    required this.overview,
    required this.name,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        overview,
        name,
        firstAirDate,
        voteAverage,
        voteCount,
      ];
}

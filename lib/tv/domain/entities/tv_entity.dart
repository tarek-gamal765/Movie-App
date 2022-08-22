import 'package:equatable/equatable.dart';

class TvEntity extends Equatable {
  final int id;
  final List genreIds;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String name;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;

  const TvEntity({
    required this.id,
    required this.genreIds,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        genreIds,
        backdropPath,
        overview,
        posterPath,
        name,
        firstAirDate,
        voteAverage,
        voteCount,
      ];
}

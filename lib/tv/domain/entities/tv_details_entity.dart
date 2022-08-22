import 'package:equatable/equatable.dart';

class TvDetailsEntity extends Equatable {
  final int id;
  final List genres;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String name;
  final String firstAirDate;
  final String lastAirDate;
  final double voteAverage;
  final String type;
  final int voteCount;

  const TvDetailsEntity({
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.voteAverage,
    required this.type,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        genres,
        backdropPath,
        overview,
        posterPath,
        name,
        firstAirDate,
        lastAirDate,
        voteAverage,
    type,
        voteCount,
      ];
}

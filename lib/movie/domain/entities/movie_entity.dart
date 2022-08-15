import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final List genreIds;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.id,
    required this.genreIds,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
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
        title,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}

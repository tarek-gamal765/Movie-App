import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final List genres;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final int voteCount;

  const MovieDetailsEntity( {
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    id,
    genres,
    backdropPath,
    overview,
    posterPath,
    title,
    releaseDate,
    voteAverage,
    runtime,
    voteCount,
  ];
}

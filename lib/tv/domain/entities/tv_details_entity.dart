import 'package:equatable/equatable.dart';
import 'package:movie_app/tv/data/models/tv_genres_model.dart';

class TvDetailsEntity extends Equatable {
  final int id;
  final List<TvGenresModel> genres;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String name;
  final String firstAirDate;
  final String lastAirDate;
  final double voteAverage;
  final String type;
  final int voteCount;
  final int numOfSeason;
  final int numOfEpisodes;

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
    required this.numOfSeason,
    required this.numOfEpisodes,
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
        numOfSeason,
        numOfEpisodes,
      ];
}

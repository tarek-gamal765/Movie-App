import 'package:movie_app/tv/domain/entities/tv_season_episode.dart';

class TvSeasonEpisodeModel extends TvSeasonEpisode {
  const TvSeasonEpisodeModel({
    required super.airDate,
    required super.episodeNumber,
    required super.id,
    required super.name,
    required super.overview,
    required super.seasonNumber,
    required super.stillPath,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvSeasonEpisodeModel.fromJson(Map<String, dynamic> json) =>
      TvSeasonEpisodeModel(
        airDate: json['air_date'],
        episodeNumber: json['episode_number'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        seasonNumber: json['season_number'],
        stillPath: json['still_path'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
    'air_date': airDate,
    'episode_number': episodeNumber,
    'id': id,
    'name': name,
    'overview': overview,
    'season_number': seasonNumber,
    'still_path': stillPath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };




}

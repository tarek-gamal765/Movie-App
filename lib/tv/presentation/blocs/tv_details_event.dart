import 'package:equatable/equatable.dart';
import 'package:movie_app/tv/domain/usecases/get_tv_season_episode_usecase.dart';

import '../../domain/entities/tv_details_entity.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int tvId;

  const GetTvDetailsEvent(this.tvId);

  @override
  List<Object?> get props => [tvId];
}

class GetRecommendationTvsEvent extends TvDetailsEvent {
  final int tvId;

  const GetRecommendationTvsEvent(this.tvId);

  @override
  List<Object?> get props => [tvId];
}

class GetTvSeasonEpisodesEvent extends TvDetailsEvent {
  final Params params;

  const GetTvSeasonEpisodesEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class InsertTvToWatchlistEvent extends TvDetailsEvent {
  final TvDetailsEntity tv;

  const InsertTvToWatchlistEvent(this.tv);

  @override
  List<Object?> get props => [tv];
}

class RemoveTvByIdFromWatchlistEvent extends TvDetailsEvent {
  final TvDetailsEntity tv;

  const RemoveTvByIdFromWatchlistEvent(this.tv);

  @override
  List<Object?> get props => [tv];
}

class RemoveAllTvsFromWatchlistEvent extends TvDetailsEvent {
  const RemoveAllTvsFromWatchlistEvent();

  @override
  List<Object?> get props => [];
}

class IsTvAddedToWatchlistEvent extends TvDetailsEvent {
  final int tvId;

  const IsTvAddedToWatchlistEvent(this.tvId);

  @override
  List<Object?> get props => [tvId];
}
class ChangeTabBarIndexEvent extends TvDetailsEvent {
  final int index;

  const ChangeTabBarIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}

import 'package:equatable/equatable.dart';

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
  final TvDetailsEntity tv;

  const RemoveAllTvsFromWatchlistEvent(this.tv);

  @override
  List<Object?> get props => [tv];
}

class IsTvAddedToWatchlistEvent extends TvDetailsEvent {
  final int tvId;

  const IsTvAddedToWatchlistEvent(this.tvId);

  @override
  List<Object?> get props => [tvId];
}

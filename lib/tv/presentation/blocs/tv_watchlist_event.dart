part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistEvent extends Equatable {
  const TvWatchlistEvent();
}
class GetAllTvsFromWatchlistEvent extends TvWatchlistEvent {
  const GetAllTvsFromWatchlistEvent();

  @override
  List<Object?> get props => [];
}
part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();
}

class GetAllMoviesFromWatchlistEvent extends MovieWatchlistEvent {
  const GetAllMoviesFromWatchlistEvent();

  @override
  List<Object?> get props => [];
}

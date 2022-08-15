part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class GetRecommendationMoviesEvent extends MovieDetailsEvent {
  final int movieId;

  const GetRecommendationMoviesEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class InsertMovieToWatchlistEvent extends MovieDetailsEvent {
  final MovieDetailsEntity movie;

  const InsertMovieToWatchlistEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveMoviesFromWatchlistEvent extends MovieDetailsEvent {
  final MovieDetailsEntity movie;

  const RemoveMoviesFromWatchlistEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class IsMovieAddedToWatchlistEvent extends MovieDetailsEvent {
  final int movieId;

  const IsMovieAddedToWatchlistEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

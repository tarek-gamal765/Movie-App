
import 'package:equatable/equatable.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/recommendation_movie_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestStates movieDetailsStates;
  final String movieDetailsMessage;
  final List<RecommendationMovieEntity> recommendationMovies;
  final RequestStates recommendationMoviesStates;
  final String recommendationMoviesMessage;
  final String addedMovieToWatchlist;
  final String addedMovieToWatchlistMessage;
  final RequestStates addedMovieToWatchlistStates;
  final String removeMovieFromWatchlist;
  final String removeMovieFromWatchlistMessage;
  final RequestStates removeMovieFromWatchlistStates;
  final bool isMovieAddedToWatchlist;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsStates = RequestStates.loading,
    this.movieDetailsMessage = AppConstants.empty,
    this.recommendationMovies = const [],
    this.recommendationMoviesStates = RequestStates.loading,
    this.recommendationMoviesMessage = AppConstants.empty,
    this.addedMovieToWatchlist = AppConstants.empty,
    this.addedMovieToWatchlistMessage = AppConstants.empty,
    this.addedMovieToWatchlistStates = RequestStates.loading,
    this.removeMovieFromWatchlist = AppConstants.empty,
    this.removeMovieFromWatchlistMessage = AppConstants.empty,
    this.removeMovieFromWatchlistStates = RequestStates.loading,
    this.isMovieAddedToWatchlist = false,
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    RequestStates? movieDetailsStates,
    String? movieDetailsMessage,
    List<RecommendationMovieEntity>? recommendationMovies,
    RequestStates? recommendationMoviesStates,
    String? recommendationMoviesMessage,
    String? addedMovieToWatchlist,
    String? addedMovieToWatchlistMessage,
    RequestStates? addedMovieToWatchlistStates,
    String? removeMovieFromWatchlist,
    String? removeMovieFromWatchlistMessage,
    RequestStates? removeMovieFromWatchlistStates,
    bool? isMovieAddedToWatchlist,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsStates: movieDetailsStates ?? this.movieDetailsStates,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationMoviesStates:
          recommendationMoviesStates ?? this.recommendationMoviesStates,
      recommendationMoviesMessage:
          recommendationMoviesMessage ?? this.recommendationMoviesMessage,
      addedMovieToWatchlist:
          addedMovieToWatchlist ?? this.addedMovieToWatchlist,
      addedMovieToWatchlistMessage:
          addedMovieToWatchlistMessage ?? this.addedMovieToWatchlistMessage,
      addedMovieToWatchlistStates:
          addedMovieToWatchlistStates ?? this.addedMovieToWatchlistStates,
      removeMovieFromWatchlist:
          removeMovieFromWatchlist ?? this.removeMovieFromWatchlist,
      removeMovieFromWatchlistMessage: removeMovieFromWatchlistMessage ??
          this.removeMovieFromWatchlistMessage,
      removeMovieFromWatchlistStates:
          removeMovieFromWatchlistStates ?? this.removeMovieFromWatchlistStates,
      isMovieAddedToWatchlist:
          isMovieAddedToWatchlist ?? this.isMovieAddedToWatchlist,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsStates,
        movieDetailsMessage,
        recommendationMovies,
        recommendationMoviesStates,
        recommendationMoviesMessage,
        addedMovieToWatchlist,
        addedMovieToWatchlistMessage,
        addedMovieToWatchlistStates,
        removeMovieFromWatchlist,
        removeMovieFromWatchlistMessage,
        removeMovieFromWatchlistStates,
        isMovieAddedToWatchlist,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entities/movie_details_entity.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';

class MovieWatchlistState extends Equatable {
  final List<MovieDetailsEntity> getAllMoviesFromWatchlist;
  final String getAllMoviesFromWatchlistMessage;
  final RequestStates getAllMoviesFromWatchlistStates;

  const MovieWatchlistState({
    this.getAllMoviesFromWatchlist = const [],
    this.getAllMoviesFromWatchlistMessage = AppConstants.empty,
    this.getAllMoviesFromWatchlistStates = RequestStates.loading,
  });

  MovieWatchlistState copyWith({
    List<MovieDetailsEntity>? getAllMoviesFromWatchlist,
    String? getAllMoviesFromWatchlistMessage,
    RequestStates? getAllMoviesFromWatchlistStates,
  }) {
    return MovieWatchlistState(
      getAllMoviesFromWatchlist:
          getAllMoviesFromWatchlist ?? this.getAllMoviesFromWatchlist,
      getAllMoviesFromWatchlistMessage:
          getAllMoviesFromWatchlistMessage ?? this.getAllMoviesFromWatchlistMessage,
      getAllMoviesFromWatchlistStates:
          getAllMoviesFromWatchlistStates ?? this.getAllMoviesFromWatchlistStates,
    );
  }

  @override
  List<Object?> get props => [
        getAllMoviesFromWatchlist,
        getAllMoviesFromWatchlistMessage,
        getAllMoviesFromWatchlistStates,
      ];
}

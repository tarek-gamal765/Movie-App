import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestStates nowPlayingMoviesStates;
  final String nowPlayingMoviesMessage;
  final List<MovieEntity> popularMovies;
  final RequestStates popularMoviesStates;
  final String popularMoviesMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestStates topRatedMoviesStates;
  final String topRatedMoviesMessage;


  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesStates = RequestStates.loading,
    this.nowPlayingMoviesMessage = AppConstants.empty,
    this.popularMovies = const [],
    this.popularMoviesStates = RequestStates.loading,
    this.popularMoviesMessage = AppConstants.empty,
    this.topRatedMovies = const [],
    this.topRatedMoviesStates = RequestStates.loading,
    this.topRatedMoviesMessage = AppConstants.empty,
  });

  MoviesState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestStates? nowPlayingMoviesStates,
    String? nowPlayingMoviesMessage,
    List<MovieEntity>? popularMovies,
    RequestStates? popularMoviesStates,
    String? popularMoviesMessage,
    List<MovieEntity>? topRatedMovies,
    RequestStates? topRatedMoviesStates,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesStates:
          nowPlayingMoviesStates ?? this.nowPlayingMoviesStates,
      nowPlayingMoviesMessage:
          nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesStates: popularMoviesStates ?? this.popularMoviesStates,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesStates: topRatedMoviesStates ?? this.topRatedMoviesStates,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesStates,
        nowPlayingMoviesMessage,
        popularMovies,
        popularMoviesStates,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesStates,
        topRatedMoviesMessage,
      ];
}

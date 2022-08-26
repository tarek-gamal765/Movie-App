import 'package:equatable/equatable.dart';
import 'package:movie_app/tv/domain/entities/tv_entity.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';
import '../../../movie/domain/entities/movie_entity.dart';

class SearchState extends Equatable {
  final List<MovieEntity> searchMovies;
  final RequestStates searchMoviesStates;
  final String searchMoviesMessage;
  final List<TvEntity> searchTvs;
  final RequestStates searchTvsStates;
  final String searchTvsMessage;

  const SearchState({
    this.searchMovies = const [],
    this.searchMoviesStates = RequestStates.loading,
    this.searchMoviesMessage = AppConstants.empty,
    this.searchTvs = const [],
    this.searchTvsMessage = AppConstants.empty,
    this.searchTvsStates = RequestStates.loading,
  });

  SearchState copyWith({
    List<MovieEntity>? searchMovies,
    RequestStates? searchMoviesStates,
    String? searchMoviesMessage,
    List<TvEntity>? searchTvs,
    RequestStates? searchTvsStates,
    String? searchTvsMessage,
  }) {
    return SearchState(
      searchMovies: searchMovies ?? this.searchMovies,
      searchMoviesStates: searchMoviesStates ?? this.searchMoviesStates,
      searchMoviesMessage: searchMoviesMessage ?? this.searchMoviesMessage,
      searchTvs: searchTvs ?? this.searchTvs,
      searchTvsStates: searchTvsStates ?? this.searchTvsStates,
      searchTvsMessage: searchTvsMessage ?? this.searchTvsMessage,
    );
  }

  @override
  List<Object?> get props => [
        searchMovies,
        searchMoviesStates,
        searchMoviesMessage,
        searchTvs,
        searchTvsStates,
        searchTvsMessage,
      ];
}

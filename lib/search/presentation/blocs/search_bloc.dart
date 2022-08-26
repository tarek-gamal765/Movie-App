import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';
import 'package:movie_app/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/search/presentation/blocs/search_event.dart';
import 'package:movie_app/search/presentation/blocs/search_state.dart';
import 'package:movie_app/tv/domain/repository/tv_repository.dart';
import 'package:movie_app/tv/domain/usecases/tv_search_usecase.dart';

import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchMovieEvent>(searchMovie);
    on<SearchTvEvent>(searchTv);
  }

  FutureOr<void> searchMovie(
      SearchMovieEvent event, Emitter<SearchState> emit) async {
    final response =
        await SearchMovieUseCase(di<MovieRepository>()).call(event.query);
    response.fold((failure) {
      return emit(state.copyWith(
        searchMoviesMessage: failure.message,
        searchMoviesStates: RequestStates.error,
      ));
    }, (data) {
      return emit(state.copyWith(
        searchMovies: data,
        searchMoviesStates: RequestStates.success,
      ));
    });
  }

  FutureOr<void> searchTv(
      SearchTvEvent event, Emitter<SearchState> emit) async {
    final response =
        await SearchTvUseCase(di<TvRepository>()).call(event.query);
    response.fold((failure) {
      return emit(state.copyWith(
        searchTvsMessage: failure.message,
        searchTvsStates: RequestStates.error,
      ));
    }, (data) {
      return emit(state.copyWith(
        searchTvs: data,
        searchTvsStates: RequestStates.success,
      ));
    });
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movies_from_watchlist_usecase.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';
import 'movie_watchlist_state.dart';

part 'movie_watchlist_event.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  MovieWatchlistBloc() : super(const MovieWatchlistState()) {
    on<GetAllMoviesFromWatchlistEvent>(getAllMoviesFromWatchlist);
  }

  Future<FutureOr<void>> getAllMoviesFromWatchlist(
      GetAllMoviesFromWatchlistEvent event,
      Emitter<MovieWatchlistState> emit) async {
    final result = await GetMoviesFromWatchlistUseCase(di<MovieRepository>())
        .call(NoPrams());
    result.fold((failure) {
      emit(state.copyWith(
        getAllMoviesFromWatchlistMessage: failure.message,
        getAllMoviesFromWatchlistStates: RequestStates.error,
      ));
    }, (data) async {
      emit(state.copyWith(
        getAllMoviesFromWatchlist: data,
        getAllMoviesFromWatchlistStates: RequestStates.success,
      ));
    });
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/recommendation_entity.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_movies_usecase.dart';
import '../../domain/usecases/insert_to_watchlist_usecase.dart';
import '../../domain/usecases/is_movie_added_to_watchlist_usecase.dart';
import '../../domain/usecases/remove_movies_from_watchlist_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(const MovieDetailsState()) {
    getMovieDetails();
    getRecommendationMovies();
    insertMovieToWatchlist();
    removeMoviesFromWatchlist();
    on<IsMovieAddedToWatchlistEvent>(_isMovieAddedToWatchlist);
  }

  bool _isAddedToWatchlist = false;

  bool get isAddedToWatchlist => _isAddedToWatchlist;

  void getMovieDetails() {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await GetMovieDetailsUseCase(di<MovieRepository>())
          .call(event.movieId);
      result.fold((failure) {
        emit(state.copyWith(
          movieDetailsMessage: failure.message,
          movieDetailsStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          movieDetails: data,
          movieDetailsStates: RequestStates.success,
        ));
      });
    });
  }

  void getRecommendationMovies() {
    on<GetRecommendationMoviesEvent>((event, emit) async {
      final result = await GetRecommendationMoviesUseCase(di<MovieRepository>())
          .call(event.movieId);
      result.fold((failure) {
        emit(state.copyWith(
          recommendationMoviesMessage: failure.message,
          recommendationMoviesStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          recommendationMovies: data,
          recommendationMoviesStates: RequestStates.success,
        ));
      });
    });
  }

  void insertMovieToWatchlist() {
    on<InsertMovieToWatchlistEvent>((event, emit) async {
      final result = await InsertToWatchlistUseCase(di<MovieRepository>())
          .call(event.movie);
      result.fold((failure) {
        emit(state.copyWith(
          addedMovieToWatchlistMessage: failure.message,
          addedMovieToWatchlistStates: RequestStates.error,
        ));
      }, (data) async {
        emit(state.copyWith(
          addedMovieToWatchlist: data,
          addedMovieToWatchlistStates: RequestStates.success,
        ));
      });
    });
  }

  void removeMoviesFromWatchlist() {
    on<RemoveMoviesFromWatchlistEvent>((event, emit) async {
      final result =
          await RemoveMoviesFromWatchlistUseCase(di<MovieRepository>())
              .call(event.movie);
      result.fold((failure) {
        emit(state.copyWith(
          addedMovieToWatchlistMessage: failure.message,
          addedMovieToWatchlistStates: RequestStates.error,
        ));
      }, (data) async {
        emit(state.copyWith(
          removeMovieFromWatchlist: data,
          removeMovieFromWatchlistStates: RequestStates.success,
        ));
      });
    });
  }

  Future<FutureOr<void>> _isMovieAddedToWatchlist(
      IsMovieAddedToWatchlistEvent event,
      Emitter<MovieDetailsState> emit) async {
    bool result = await IsMovieAddedToWatchlistUseCase(di<MovieRepository>())
        .call(event.movieId);
    _isAddedToWatchlist = result;
    emit(state.copyWith(isMovieAddedToWatchlist: result));
  }

}

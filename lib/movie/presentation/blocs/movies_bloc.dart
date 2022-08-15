import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/dependency_injection.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/blocs/movies_event.dart';
import 'package:movie_app/movie/presentation/blocs/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieBloc() : super(const MoviesState()) {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
  }

  void getNowPlayingMovies() {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await GetNowPlayingMoviesUseCase(di<MovieRepository>())
          .call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          nowPlayingMoviesMessage: failure.message,
          nowPlayingMoviesStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          nowPlayingMovies: data,
          nowPlayingMoviesStates: RequestStates.success,
        ));
      });
    });
  }

  void getPopularMovies() {
    on<GetPopularMoviesEvent>((event, emit) async {
      final result =
          await GetPopularMoviesUseCase(di<MovieRepository>()).call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          popularMoviesMessage: failure.message,
          popularMoviesStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          popularMovies: data,
          popularMoviesStates: RequestStates.success,
        ));
      });
    });
  }

  void getTopRatedMovies() {
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result =
          await GetTopRatedMoviesUseCase(di<MovieRepository>()).call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          topRatedMoviesMessage: failure.message,
          topRatedMoviesStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          topRatedMovies: data,
          topRatedMoviesStates: RequestStates.success,
        ));
      });
    });
  }

}

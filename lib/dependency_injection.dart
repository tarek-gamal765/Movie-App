import 'package:get_it/get_it.dart';
import 'package:movie_app/core/global/lib/presentation/bloc/app_bloc.dart';
import 'package:movie_app/movie/data/data_source/movie_local_data_source/db/movie_data_base_helper.dart';
import 'package:movie_app/movie/data/data_source/movie_local_data_source/movie_local_data_source.dart';
import 'package:movie_app/movie/domain/usecases/insert_to_watchlist_usecase.dart';
import 'package:movie_app/movie/domain/usecases/is_movie_added_to_watchlist_usecase.dart';
import 'package:movie_app/movie/domain/usecases/remove_movies_from_watchlist_usecase.dart';

import 'movie/data/data_source/movie_remote_data_source/movie_remote_data_source.dart';
import 'movie/data/repository/movie_repository_impl.dart';
import 'movie/domain/repository/movie_repository.dart';
import 'movie/domain/usecases/get_movie_details_usecase.dart';
import 'movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'movie/domain/usecases/get_popular_movies_usecase.dart';
import 'movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'movie/presentation/blocs/movie_details_bloc.dart';
import 'movie/presentation/blocs/movies_bloc.dart';

final di = GetIt.instance;

void init() {
  //blocs
  di.registerFactory(() => AppBloc());
  di.registerFactory(() => MovieBloc());
  di.registerFactory(() => MovieDetailsBloc());

  //data source
  di.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(),
  );
  di.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(
      di<MovieDatabaseHelper>(),
    ),
  );

  //repositories
  di.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      di<MovieRemoteDataSource>(),
      di<MovieLocalDataSource>(),
    ),
  );

  //use cases
  di.registerLazySingleton<GetNowPlayingMoviesUseCase>(
    () => GetNowPlayingMoviesUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<GetTopRatedMoviesUseCase>(
    () => GetTopRatedMoviesUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<GetRecommendationMoviesUseCase>(
    () => GetRecommendationMoviesUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<InsertToWatchlistUseCase>(
    () => InsertToWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<RemoveMoviesFromWatchlistUseCase>(
    () => RemoveMoviesFromWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<IsMovieAddedToWatchlistUseCase>(
    () => IsMovieAddedToWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  //database
  di.registerLazySingleton<MovieDatabaseHelper>(
    () => MovieDatabaseHelper(),
  );
}

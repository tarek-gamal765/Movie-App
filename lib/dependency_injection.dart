import 'package:get_it/get_it.dart';
import 'package:movie_app/core/global/lib/presentation/bloc/app_bloc.dart';
import 'package:movie_app/movie/domain/usecases/insert_movie_to_watchlist_usecase.dart';
import 'package:movie_app/movie/domain/usecases/is_movie_added_to_watchlist_usecase.dart';
import 'package:movie_app/movie/domain/usecases/remove_movie_from_watchlist_usecase.dart';
import 'package:movie_app/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/search/presentation/blocs/search_bloc.dart';
import 'package:movie_app/tv/data/data_source/tv_local_data_source/db/tv_data_base_helper.dart';
import 'package:movie_app/tv/data/data_source/tv_local_data_source/tv_local_data_source.dart';
import 'package:movie_app/tv/data/data_source/tv_remote_data_source/tv_remote_data_source.dart';
import 'package:movie_app/tv/data/repository/tv_repository_impl.dart';
import 'package:movie_app/tv/domain/repository/tv_repository.dart';
import 'package:movie_app/tv/domain/usecases/get_recommendation_tvs_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_tv_details_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_tv_season_episode_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_tvs_from_watchlist_usecase.dart';
import 'package:movie_app/tv/domain/usecases/insert_tv_to_watchlist_usecase.dart';
import 'package:movie_app/tv/domain/usecases/is_tv_added_to_watchlist_usecase.dart';
import 'package:movie_app/tv/domain/usecases/remove_tv_by_id_from_watchlist_usecase.dart';
import 'package:movie_app/tv/domain/usecases/remove_tvs_from_watchlist_use_case.dart';
import 'package:movie_app/tv/domain/usecases/tv_search_usecase.dart';
import 'package:movie_app/tv/presentation/blocs/tv_details_bloc.dart';
import 'package:movie_app/tv/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:movie_app/tv/presentation/blocs/Tvs_bloc.dart';
import 'package:movie_app/movie/data/data_source/movie_local_data_source/db/movie_data_base_helper.dart';
import 'package:movie_app/movie/data/data_source/movie_local_data_source/movie_local_data_source.dart';
import 'package:movie_app/movie/data/data_source/movie_remote_data_source/movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repository/movie_repository_impl.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/blocs/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/blocs/movies_bloc.dart';
import 'package:movie_app/tv/presentation/blocs/tv_watchlist_bloc.dart';

import 'movie/presentation/blocs/movie_watchlist_bloc.dart';

final di = GetIt.instance;

void init() {
  //blocs
  di.registerFactory(() => AppBloc());
  di.registerFactory(() => MovieBloc());
  di.registerFactory(() => MovieDetailsBloc());
  di.registerFactory(() => TvsBloc());
  di.registerFactory(() => TvDetailsBloc());
  di.registerFactory(() => TvWatchlistBloc());
  di.registerFactory(() => MovieWatchlistBloc());
  di.registerFactory(() => SearchBloc());

  //data source
  di.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(),
  );
  di.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(
      di<MovieDatabaseHelper>(),
    ),
  );
  di.registerLazySingleton<TvRemoteDataSource>(
    () => TvRemoteDataSourceImpl(),
  );
  di.registerLazySingleton<TvLocalDataSource>(
    () => TvLocalDataSourceImpl(
      di<TvDatabaseHelper>(),
    ),
  );

  //repositories
  di.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      di<MovieRemoteDataSource>(),
      di<MovieLocalDataSource>(),
    ),
  );
  di.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      di<TvRemoteDataSource>(),
      di<TvLocalDataSource>(),
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
  di.registerLazySingleton<InsertMovieToWatchlistUseCase>(
    () => InsertMovieToWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<RemoveMovieFromWatchlistUseCase>(
    () => RemoveMovieFromWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<IsMovieAddedToWatchlistUseCase>(
    () => IsMovieAddedToWatchlistUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<GetNowPlayingTvsUseCase>(
    () => GetNowPlayingTvsUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetPopularTvsUseCase>(
    () => GetPopularTvsUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetTopRatedTvsUseCase>(
    () => GetTopRatedTvsUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetTvDetailsUseCase>(
    () => GetTvDetailsUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetRecommendationTvsUseCase>(
    () => GetRecommendationTvsUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<InsertTvToWatchlistUseCase>(
    () => InsertTvToWatchlistUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<RemoveTvByIdFromWatchlistUseCase>(
    () => RemoveTvByIdFromWatchlistUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<RemoveTvsFromWatchlistUseCase>(
    () => RemoveTvsFromWatchlistUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<IsTvAddedToWatchlistUseCase>(
    () => IsTvAddedToWatchlistUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetTvSeasonEpisodesUseCase>(
    () => GetTvSeasonEpisodesUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<GetTvsFromWatchlistUseCase>(
    () => GetTvsFromWatchlistUseCase(
      di<TvRepository>(),
    ),
  );
  di.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(
      di<MovieRepository>(),
    ),
  );
  di.registerLazySingleton<SearchTvUseCase>(
    () => SearchTvUseCase(
      di<TvRepository>(),
    ),
  );
  //database
  di.registerLazySingleton<MovieDatabaseHelper>(
    () => MovieDatabaseHelper(),
  );
  di.registerLazySingleton<TvDatabaseHelper>(
    () => TvDatabaseHelper(),
  );
}

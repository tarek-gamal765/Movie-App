import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/recommendation_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);

  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationMovies(
      int movieId);

  Future<Either<Failure, String>> insertMovieToWatchlist(MovieDetailsEntity movie);

  Future<Either<Failure, String>> removeMovieFromWatchlist(MovieDetailsEntity movie);
  Future<Either<Failure, List<MovieDetailsEntity>>> getMoviesFromWatchlist();
  Future<bool> isMovieAddedToWatchlist(int id);


}

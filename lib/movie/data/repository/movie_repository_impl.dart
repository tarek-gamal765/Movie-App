import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/data/models/movie_table_model.dart';
import 'package:movie_app/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_app/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/movie/domain/entities/recommendation_movie_entity.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';

import '../data_source/movie_local_data_source/movie_local_data_source.dart';
import '../data_source/movie_remote_data_source/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource, this._movieLocalDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final response = await _movieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final response = await _movieRemoteDataSource.getPopularMovies();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final response = await _movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      int movieId) async {
    final response = await _movieRemoteDataSource.getMovieDetails(movieId);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecommendationMovieEntity>>>
      getRecommendationMovies(int movieId) async {
    final response =
        await _movieRemoteDataSource.getRecommendationMovies(movieId);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, String>> insertMovieToWatchlist(
      MovieDetailsEntity movie) async {
    final response = await _movieLocalDataSource.insertMovieToWatchlist(
      MovieTableModel.formEntity(movie),
    );
    try {
      return Right(response);
    } on DatabaseException catch (failure) {
      return Left(
        DatabaseFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, String>> removeMovieFromWatchlist(
      MovieDetailsEntity movie) async {
    final response = await _movieLocalDataSource.removeMovieFromWatchlist(
      MovieTableModel.formEntity(movie),
    );
    try {
      return Right(response);
    } on DatabaseException catch (failure) {
      return Left(
        DatabaseFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsEntity>>>
      getMoviesFromWatchlist() async {
    final response = await _movieLocalDataSource.getMoviesFromWatchlist();

    try {
      return Right(response);
    } on DatabaseException catch (failure) {
      return Left(
        DatabaseFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<bool> isMovieAddedToWatchlist(int id) async {
    final response = await _movieLocalDataSource.getMovieByIdFromWatchlist(id);
    return response != null;
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String query) async {
    final response = await _movieRemoteDataSource.searchMovie(query);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }
}

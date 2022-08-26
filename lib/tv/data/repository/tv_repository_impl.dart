import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/tv/domain/entities/recommendation_tv_entity.dart';
import 'package:movie_app/tv/domain/entities/tv_details_entity.dart';
import 'package:movie_app/tv/domain/entities/tv_entity.dart';
import 'package:movie_app/tv/domain/entities/tv_season_episode.dart';
import 'package:movie_app/tv/domain/repository/tv_repository.dart';

import '../../../core/error/exceptions.dart';
import '../data_source/tv_local_data_source/tv_local_data_source.dart';
import '../data_source/tv_remote_data_source/tv_remote_data_source.dart';
import '../models/tv_table_model.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource _tvRemoteDataSource;
  final TvLocalDataSource _tvLocalDataSource;

  TvRepositoryImpl(this._tvRemoteDataSource, this._tvLocalDataSource);

  @override
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTvs() async {
    final response = await _tvRemoteDataSource.getOnTheAirTvs();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getPopularTvs() async {
    final response = await _tvRemoteDataSource.getPopularTvs();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getTopRatedTvs() async {
    final response = await _tvRemoteDataSource.getTopRatedTvs();
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, TvDetailsEntity>> getTvDetails(int tvId) async {
    final response = await _tvRemoteDataSource.getTvDetails(tvId);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecommendationTvEntity>>> getRecommendationTvs(
      int tvId) async {
    final response = await _tvRemoteDataSource.getRecommendationTvs(tvId);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvSeasonEpisode>>> getTvSeasonEpisode(
      int tvId, int seasonNumber) async {
    final response =
        await _tvRemoteDataSource.getTvSeasonEpisodes(tvId, seasonNumber);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, String>> insertTvToWatchlist(
      TvDetailsEntity tv) async {
    final response = await _tvLocalDataSource.insertTvToWatchlist(
      TvTableModel.formEntity(tv),
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
  Future<Either<Failure, String>> removeTvByIdFromWatchlist(
      TvDetailsEntity tv) async {
    final response = await _tvLocalDataSource.removeTvByIdFromWatchlist(
      TvTableModel.formEntity(tv),
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
  Future<Either<Failure, String>> removeAllTvsFromWatchlist() async {
    final response = await _tvLocalDataSource.removeAllTvsFromWatchlist();
    try {
      return Right(response);
    } on DatabaseException catch (failure) {
      return Left(
        DatabaseFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvDetailsEntity>>> getTvsFromWatchlist() async {
    final response = await _tvLocalDataSource.getTvsFromWatchlist();
    try {
      return Right(response);
    } on DatabaseException catch (failure) {
      return Left(
        DatabaseFailure(failure.errorModel.statusMessage),
      );
    }
  }

  @override
  Future<bool> isTvAddedToWatchlist(int id) async {
    final response = await _tvLocalDataSource.getTvByIdFromWatchlist(id);
    return response != null;
  }

  @override
  Future<Either<Failure, List<TvEntity>>> searchTv(String query) async {
    final response = await _tvRemoteDataSource.searchTv(query);
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorModel.statusMessage),
      );
    }
  }
}

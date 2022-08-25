import 'package:dartz/dartz.dart';
import 'package:movie_app/tv/domain/entities/tv_season_episode.dart';

import '../../../core/error/failure.dart';
import '../entities/recommendation_tv_entity.dart';
import '../entities/tv_details_entity.dart';
import '../entities/tv_entity.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTvs();

  Future<Either<Failure, List<TvEntity>>> getPopularTvs();

  Future<Either<Failure, List<TvEntity>>> getTopRatedTvs();

  Future<Either<Failure, TvDetailsEntity>> getTvDetails(int tvId);

  Future<Either<Failure, List<RecommendationTvEntity>>> getRecommendationTvs(
      int tvId);

  Future<Either<Failure, List<TvSeasonEpisode>>> getTvSeasonEpisode(
      int tvId, int seasonNumber);

  Future<Either<Failure, String>> insertTvToWatchlist(TvDetailsEntity tv);

  Future<Either<Failure, String>> removeTvByIdFromWatchlist(TvDetailsEntity tv);

  Future<Either<Failure, String>> removeAllTvsFromWatchlist();

  Future<Either<Failure, List<TvDetailsEntity>>> getTvsFromWatchlist();

  Future<bool> isTvAddedToWatchlist(int tvId);
}

import 'package:dio/dio.dart';
import 'package:movie_app/tv/data/models/tv_season_episode_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/urls.dart';
import '../../models/recommendatin_tv_model.dart';
import '../../models/tv_details_model.dart';
import '../../models/tv_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();

  Future<List<TvModel>> getPopularTvs();

  Future<List<TvModel>> getTopRatedTvs();

  Future<TvDetailsModel> getTvDetails(int tvId);

  Future<List<RecommendationTvModel>> getRecommendationTvs(int tvId);

  Future<List<TvSeasonEpisodeModel>> getTvSeasonEpisodes(
      int tvId, int seasonNumber);
  Future< List<TvModel>> searchTv(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTvs() async {
    final response = await Dio().get(Urls.onTheAirTvsUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (element) => TvModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<TvModel>> getPopularTvs() async {
    final response = await Dio().get(Urls.popularTvsUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (element) => TvModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvs() async {
    final response = await Dio().get(Urls.topRatedTvsUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (element) => TvModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(int tvId) async {
    final response = await Dio().get(Urls.tvDetailsUrl(tvId));
    if (response.statusCode == AppConstants.successCode) {
      return TvDetailsModel.formJson(response.data);
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<RecommendationTvModel>> getRecommendationTvs(int tvId) async {
    final response = await Dio().get(Urls.recommendationTvsUrl(tvId));
    if (response.statusCode == AppConstants.successCode) {
      return List<RecommendationTvModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationTvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<TvSeasonEpisodeModel>> getTvSeasonEpisodes(
      int tvId, int seasonNumber) async {
    final response = await Dio().get(Urls.tvSeasons(tvId,seasonNumber));
    if (response.statusCode == AppConstants.successCode) {
      return List<TvSeasonEpisodeModel>.from(
        (response.data['episodes'] as List)
            .map((x) => TvSeasonEpisodeModel.fromJson(x))
            .where((element) => element.stillPath != null),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<TvModel>> searchTv(String query) async {
    final response = await Dio().get(Urls.tvSearch(query));
    if (response.statusCode == AppConstants.successCode) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
              (element) => TvModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }
}

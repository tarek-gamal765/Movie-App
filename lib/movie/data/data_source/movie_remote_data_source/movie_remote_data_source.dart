import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/urls.dart';
import 'package:movie_app/movie/data/models/movie_details_model.dart';
import 'package:movie_app/movie/data/models/movie_model.dart';
import 'package:movie_app/movie/data/models/recommendatin_movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(int movieId);

  Future<List<RecommendationMovieModel>> getRecommendationMovies(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(Urls.nowPlayingUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (element) => MovieModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(Urls.popularMoviesUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (element) => MovieModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(Urls.topRatedMoviesUrl);
    if (response.statusCode == AppConstants.successCode) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (element) => MovieModel.formJson(element),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await Dio().get(Urls.movieDetailsUrl(movieId));
    if (response.statusCode == AppConstants.successCode) {
      return MovieDetailsModel.formJson(response.data);
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<RecommendationMovieModel>> getRecommendationMovies(
      int movieId) async {
    final response = await Dio().get(Urls.recommendationMoviesUrl(movieId));
    if (response.statusCode == AppConstants.successCode) {
      return List<RecommendationMovieModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationMovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }
}

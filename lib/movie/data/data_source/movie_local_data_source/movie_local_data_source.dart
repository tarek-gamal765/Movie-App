import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/movie/data/data_source/movie_local_data_source/db/movie_data_base_helper.dart';

import '../../models/movie_table_model.dart';

abstract class MovieLocalDataSource {
  Future<String> insertMovieToWatchlist(MovieTableModel movie);

  Future<String> removeMovieFromWatchlist(MovieTableModel movie);

  Future<List<MovieTableModel>> getMoviesFromWatchlist();

  Future<MovieTableModel?> getMovieByIdFromWatchlist(int id);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final MovieDatabaseHelper _movieDatabaseHelper;

  MovieLocalDataSourceImpl(this._movieDatabaseHelper);

  @override
  Future<String> insertMovieToWatchlist(MovieTableModel movie) async {
    try {
      await _movieDatabaseHelper.insertMovieToWatchlist(movie);
      return 'Added To Watchlist';
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<String> removeMovieFromWatchlist(MovieTableModel movie) async {
    try {
      await _movieDatabaseHelper.removeMovieFromWatchlist(movie);
      return 'Add To Watchlist';
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<List<MovieTableModel>> getMoviesFromWatchlist() async {
    try {
      final result = await _movieDatabaseHelper.getMoviesFromWatchlist();
      return result.map((e) => MovieTableModel.formJson(e)).toList();
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<MovieTableModel?> getMovieByIdFromWatchlist(int id) async {
    try {
      final result = await _movieDatabaseHelper.getMovieByIdFromWatchlist(id);
      if (result != null) {
        return MovieTableModel.formJson(result);
      } else {
        return null;
      }
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }
}

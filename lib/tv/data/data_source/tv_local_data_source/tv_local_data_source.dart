import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/tv/data/data_source/tv_local_data_source/db/tv_data_base_helper.dart';

import '../../../../core/utils/app_strings.dart';
import '../../models/tv_table_model.dart';

abstract class TvLocalDataSource {
  Future<String> insertTvToWatchlist(TvTableModel tv);

  Future<String> removeTvByIdFromWatchlist(TvTableModel tv);

  Future<String> removeAllTvsFromWatchlist();

  Future<List<TvTableModel>> getTvsFromWatchlist();

  Future<TvTableModel?> getTvByIdFromWatchlist(int id);
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final TvDatabaseHelper _tvDatabaseHelper;

  TvLocalDataSourceImpl(this._tvDatabaseHelper);

  @override
  Future<String> insertTvToWatchlist(TvTableModel tv) async {
    try {
      await _tvDatabaseHelper.insertTvToWatchlist(tv);
      return AppStrings.removeFromWatchlist;
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<String> removeTvByIdFromWatchlist(TvTableModel tv) async {
    try {
      await _tvDatabaseHelper.removeTvFromWatchlist(tv);
      return AppStrings.addToWatchlist;
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<String> removeAllTvsFromWatchlist() async {
    try {
      await _tvDatabaseHelper.removeAllTvsWatchlist();
      return 'All tvs removed successfully';
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<List<TvTableModel>> getTvsFromWatchlist() async {
    try {
      final result = await _tvDatabaseHelper.getTvsFromWatchlist();
      print('result :::: $result');
      return result.map((e) => TvTableModel.formJson(e)).toList();
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }

  @override
  Future<TvTableModel?> getTvByIdFromWatchlist(int id) async {
    try {
      final result = await _tvDatabaseHelper.getTvByIdFromWatchlist(id);
      if (result != null) {
        return TvTableModel.formJson(result);
      } else {
        return null;
      }
    } on DatabaseException catch (e) {
      throw DatabaseException(e.errorModel);
    }
  }
}

import 'package:movie_app/tv/data/models/tv_table_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/utils/app_strings.dart';

class TvDatabaseHelper {
  TvDatabaseHelper();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB();
      return _database;
    }
  }

  Future<Database> _initDB() async {
    final String path = await getDatabasesPath();
    final String databasePath = '$path${AppStrings.tvDbPath}';
    var db = await openDatabase(databasePath, onCreate: _onCreate, version: 1);
    return db;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${AppStrings.tvDbTableName} (
      id INTEGER PRIMARY KEY,
      backdropPath TEXT,
      overview TEXT,
      posterPath TEXT,
      name TEXT,
      firstAirDate TEXT,
      lastAirDate TEXT,
      type TEXT,
      voteAverage DOUBLE,
      voteCount INTEGER
    )
    ''');
  }

  Future<int> insertTvToWatchlist(TvTableModel movie) async {
    final db = await database;
    final result = await db!.insert(
      AppStrings.tvDbTableName,
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await getTvsFromWatchlist();
    return result;
  }

  Future<int> removeTvFromWatchlist(TvTableModel movie) async {
    final db = await database;
    return await db!.delete(
      AppStrings.tvDbTableName,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<int> removeTvsWatchlist(TvTableModel movie) async {
    final db = await database;
    return await db!.delete(
      AppStrings.tvDbTableName,
    );
  }

  Future<Map<String, dynamic>?> getTvByIdFromWatchlist(int id) async {
    final db = await database;
    final result = await db!.query(
      AppStrings.tvDbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getTvsFromWatchlist() async {
    final db = await database;
    return await db!.query(
      AppStrings.tvDbTableName,
    );
  }
}

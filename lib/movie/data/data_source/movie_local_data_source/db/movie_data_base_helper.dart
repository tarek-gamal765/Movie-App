import 'package:movie_app/movie/data/models/movie_table_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/utils/app_strings.dart';

class MovieDatabaseHelper {
  MovieDatabaseHelper();

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
    final String databasePath = '$path${AppStrings.movieDbPath}';
    var db = await openDatabase(databasePath, onCreate: _onCreate, version: 1);
    return db;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${AppStrings.movieDbTableName} (
      id INTEGER PRIMARY KEY,
      backdropPath TEXT,
      overview TEXT,
      posterPath TEXT,
      title TEXT,
      releaseDate TEXT,
      voteAverage DOUBLE,
      voteCount INTEGER
    )
    ''');
  }

  Future<int> insertMovieToWatchlist(MovieTableModel movie) async {
    final db = await database;
    final result = await db!.insert(
      AppStrings.movieDbTableName,
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await getMoviesFromWatchlist();
    return result;
  }

  Future<int> removeMovieFromWatchlist(MovieTableModel movie) async {
    final db = await database;
    return await db!.delete(
      AppStrings.movieDbTableName,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<Map<String, dynamic>?> getMovieByIdFromWatchlist(int id) async {
    final db = await database;
    final result = await db!.query(
      AppStrings.movieDbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getMoviesFromWatchlist() async {
    final db = await database;
    return await db!.query(
      AppStrings.movieDbTableName,
    );
  }
}

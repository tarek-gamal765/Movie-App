import 'package:movie_app/core/network/error_model.dart';

class ServerException implements Exception {
  ErrorModel errorModel;

  ServerException(this.errorModel);
}

class DatabaseException implements Exception {
  ErrorModel errorModel;

  DatabaseException(this.errorModel);
}

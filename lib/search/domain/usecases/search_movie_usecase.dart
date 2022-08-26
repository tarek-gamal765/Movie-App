import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/movie/domain/repository/movie_repository.dart';

import '../../../core/error/failure.dart';

class SearchMovieUseCase extends BaseUseCase<String, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  SearchMovieUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String input) async {
    return await _movieRepository.searchMovie(input);
  }
}

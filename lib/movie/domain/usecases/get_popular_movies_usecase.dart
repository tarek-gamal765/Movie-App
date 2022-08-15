import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movie/domain/entities/movie_entity.dart';

import '../repository/movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<NoPrams, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoPrams input) async {
    return await _movieRepository.getPopularMovies();
  }
}

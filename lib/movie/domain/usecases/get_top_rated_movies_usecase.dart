import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_entity.dart';
import '../repository/movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<NoPrams, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  GetTopRatedMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoPrams input) async {
    return await _movieRepository.getTopRatedMovies();
  }
}

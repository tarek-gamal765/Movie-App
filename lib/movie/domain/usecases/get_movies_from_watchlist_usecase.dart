import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_details_entity.dart';
import '../repository/movie_repository.dart';

class GetMoviesFromWatchlistUseCase
    extends BaseUseCase<NoPrams, List<MovieDetailsEntity>> {
  final MovieRepository _movieRepository;

  GetMoviesFromWatchlistUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieDetailsEntity>>> call(NoPrams input) async {
    return await _movieRepository.getMoviesFromWatchlist();
  }
}

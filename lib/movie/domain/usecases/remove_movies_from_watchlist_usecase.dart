import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_details_entity.dart';
import '../repository/movie_repository.dart';

class RemoveMoviesFromWatchlistUseCase
    extends BaseUseCase<MovieDetailsEntity, String> {
  final MovieRepository _movieRepository;

  RemoveMoviesFromWatchlistUseCase(this._movieRepository);

  @override
  Future<Either<Failure, String>> call(MovieDetailsEntity input) async {
    return await _movieRepository.removeMovieFromWatchlist(input);
  }
}

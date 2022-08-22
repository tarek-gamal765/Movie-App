import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_details_entity.dart';
import '../repository/movie_repository.dart';

class RemoveMovieFromWatchlistUseCase
    extends BaseUseCase<MovieDetailsEntity, String> {
  final MovieRepository _movieRepository;

  RemoveMovieFromWatchlistUseCase(this._movieRepository);

  @override
  Future<Either<Failure, String>> call(MovieDetailsEntity input) async {
    return await _movieRepository.removeMovieFromWatchlist(input);
  }
}

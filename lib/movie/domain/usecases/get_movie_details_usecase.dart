import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/domain/entities/movie_details_entity.dart';

import '../../../core/usecase/base_usecase.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<int, MovieDetailsEntity> {
  final MovieRepository _movieRepository;

  GetMovieDetailsUseCase(this._movieRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(int input) async {
    return await _movieRepository.getMovieDetails( input);
  }
}

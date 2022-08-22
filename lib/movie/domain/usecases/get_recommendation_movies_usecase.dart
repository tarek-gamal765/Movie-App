import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/domain/entities/recommendation_movie_entity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/movie_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<int, List<RecommendationMovieEntity>> {
  final MovieRepository _movieRepository;

  GetRecommendationMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<RecommendationMovieEntity>>> call(int input) async {
    return await _movieRepository.getRecommendationMovies(input);
  }
}
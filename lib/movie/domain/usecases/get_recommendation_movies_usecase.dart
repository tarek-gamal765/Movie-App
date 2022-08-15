import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/domain/entities/recommendation_entity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/movie_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<int, List<RecommendationEntity>> {
  final MovieRepository _movieRepository;

  GetRecommendationMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(int input) async {
    return await _movieRepository.getRecommendationMovies(input);
  }
}
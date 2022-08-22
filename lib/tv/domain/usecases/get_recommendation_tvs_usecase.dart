import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/recommendation_tv_entity.dart';
import '../repository/tv_repository.dart';

class GetRecommendationTvsUseCase extends BaseUseCase<int, List<RecommendationTvEntity>> {
  final TvRepository _tvRepository;

  GetRecommendationTvsUseCase(this._tvRepository);

  @override
  Future<Either<Failure, List<RecommendationTvEntity>>> call(int input) async {
    return await _tvRepository.getRecommendationTvs(input);
  }
}
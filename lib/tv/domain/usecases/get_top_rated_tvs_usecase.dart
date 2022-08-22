import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/tv_entity.dart';
import '../repository/tv_repository.dart';

class GetTopRatedTvsUseCase extends BaseUseCase<NoPrams, List<TvEntity>> {
  final TvRepository _tvRepository;

  GetTopRatedTvsUseCase(this._tvRepository);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoPrams input) async {
    return await _tvRepository.getTopRatedTvs();
  }
}

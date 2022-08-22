import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/tv_details_entity.dart';
import '../repository/tv_repository.dart';

class GetTvsFromWatchlistUseCase
    extends BaseUseCase<NoPrams, List<TvDetailsEntity>> {
  final TvRepository _tvRepository;

  GetTvsFromWatchlistUseCase(this._tvRepository);

  @override
  Future<Either<Failure, List<TvDetailsEntity>>> call(NoPrams input) async {
    return await _tvRepository.getTvsFromWatchlist();
  }
}

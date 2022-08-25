import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/tv_repository.dart';

class RemoveTvsFromWatchlistUseCase extends BaseUseCase<NoPrams, String> {
  final TvRepository _tvRepository;

  RemoveTvsFromWatchlistUseCase(this._tvRepository);

  @override
  Future<Either<Failure, String>> call(NoPrams input) async {
    return await _tvRepository.removeAllTvsFromWatchlist();
  }
}

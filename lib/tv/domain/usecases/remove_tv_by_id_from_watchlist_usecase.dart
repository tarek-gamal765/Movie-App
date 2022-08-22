import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/tv_details_entity.dart';
import '../repository/tv_repository.dart';

class RemoveTvByIdFromWatchlistUseCase
    extends BaseUseCase<TvDetailsEntity, String> {
  final TvRepository _tvRepository;

  RemoveTvByIdFromWatchlistUseCase(this._tvRepository);

  @override
  Future<Either<Failure, String>> call(TvDetailsEntity input) async {
    return await _tvRepository.removeTvByIdFromWatchlist(input);
  }
}

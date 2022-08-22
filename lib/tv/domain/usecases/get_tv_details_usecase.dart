import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';

import '../../../core/usecase/base_usecase.dart';
import '../entities/tv_details_entity.dart';
import '../repository/tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<int, TvDetailsEntity> {
  final TvRepository _tvRepository;

  GetTvDetailsUseCase(this._tvRepository);

  @override
  Future<Either<Failure, TvDetailsEntity>> call(int input) async {
    return await _tvRepository.getTvDetails( input);
  }
}

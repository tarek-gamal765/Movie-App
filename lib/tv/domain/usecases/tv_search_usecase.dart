import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/tv/domain/entities/tv_entity.dart';
import 'package:movie_app/tv/domain/repository/tv_repository.dart';

class SearchTvUseCase extends BaseUseCase<String, List<TvEntity>> {
  final TvRepository _tvRepository;

  SearchTvUseCase(this._tvRepository);

  @override
  Future<Either<Failure, List<TvEntity>>> call(String input) async {
    return await _tvRepository.searchTv(input);
  }
}

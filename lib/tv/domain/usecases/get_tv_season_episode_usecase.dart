import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/tv/domain/entities/tv_season_episode.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/tv_repository.dart';

class GetTvSeasonEpisodesUseCase extends BaseUseCase<Params, List<TvSeasonEpisode>> {
  final TvRepository _tvRepository;

  GetTvSeasonEpisodesUseCase(this._tvRepository);

  @override
  Future<Either<Failure, List<TvSeasonEpisode>>> call(Params input) async {
    return await _tvRepository.getTvSeasonEpisode(
      input.tvId,
      input.seasonNumber,
    );
  }
}

class Params extends Equatable {
  final int tvId;
  final int seasonNumber;

  const Params(this.tvId, this.seasonNumber);

  @override
  List<Object?> get props => [tvId, seasonNumber];
}

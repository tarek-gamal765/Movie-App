
import '../repository/tv_repository.dart';

class IsTvAddedToWatchlistUseCase {
  final TvRepository _tvRepository;

  IsTvAddedToWatchlistUseCase(this._tvRepository);

  Future<bool> call(int input) async {
    return await _tvRepository.isTvAddedToWatchlist(input);
  }
}

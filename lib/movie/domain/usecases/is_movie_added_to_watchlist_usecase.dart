
import '../repository/movie_repository.dart';

class IsMovieAddedToWatchlistUseCase {
  final MovieRepository _movieRepository;

  IsMovieAddedToWatchlistUseCase(this._movieRepository);

  Future<bool> call(int input) async {
    return await _movieRepository.isMovieAddedToWatchlist(input);
  }
}

import '../../../core/utils/app_strings.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieTableModel extends MovieDetailsEntity {
  const MovieTableModel({
    required super.id,
    super.genres = const [],
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    super.runtime = 0,
    required super.voteCount,
  });

  factory MovieTableModel.formJson(Map<String, dynamic> json) =>
      MovieTableModel(
        id: json['id'],
        backdropPath: json[AppStrings.movieBackdropPathTable],
        overview: json[AppStrings.movieOverviewTable],
        posterPath: json[AppStrings.moviePosterPathTable],
        title: json[AppStrings.movieTitleTable],
        releaseDate: json[AppStrings.movieReleaseDateTable],
        voteAverage: json[AppStrings.movieVoteAverageTable].toDouble(),
        voteCount: json[AppStrings.movieVoteCountTable],
      );

  Map<String, dynamic> toJson() => {
        AppStrings.movieIdTable: id,
        AppStrings.movieBackdropPathTable: backdropPath,
        AppStrings.movieOverviewTable: overview,
        AppStrings.moviePosterPathTable: posterPath,
        AppStrings.movieTitleTable: title,
        AppStrings.movieReleaseDateTable: releaseDate,
        AppStrings.movieVoteAverageTable: voteAverage,
        AppStrings.movieVoteCountTable: voteCount,
      };

  factory MovieTableModel.formEntity(MovieDetailsEntity movieDetails) =>
      MovieTableModel(
        id: movieDetails.id,
        backdropPath: movieDetails.backdropPath,
        overview: movieDetails.overview,
        posterPath: movieDetails.posterPath,
        title: movieDetails.title,
        releaseDate: movieDetails.releaseDate,
        voteAverage: movieDetails.voteAverage,
        voteCount: movieDetails.voteCount,
      );
}

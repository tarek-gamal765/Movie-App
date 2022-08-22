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
        backdropPath: json[AppStrings.backdropPathTable],
        overview: json[AppStrings.overviewTable],
        posterPath: json[AppStrings.posterPathTable],
        title: json[AppStrings.titleTable],
        releaseDate: json[AppStrings.releaseDateTable],
        voteAverage: json[AppStrings.voteAverageTable].toDouble(),
        voteCount: json[AppStrings.voteCountTable],
      );

  Map<String, dynamic> toJson() => {
        AppStrings.idTable: id,
        AppStrings.backdropPathTable: backdropPath,
        AppStrings.overviewTable: overview,
        AppStrings.posterPathTable: posterPath,
        AppStrings.titleTable: title,
        AppStrings.releaseDateTable: releaseDate,
        AppStrings.voteAverageTable: voteAverage,
        AppStrings.voteCountTable: voteCount,
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

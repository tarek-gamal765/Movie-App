import '../../../core/utils/app_strings.dart';
import '../../domain/entities/tv_details_entity.dart';

class TvTableModel extends TvDetailsEntity {
  const TvTableModel({
    required super.id,
    super.genres = const [],
    required super.backdropPath,
    required super.overview,
    required super.posterPath,
    required super.name,
    required super.firstAirDate,
    required super.lastAirDate,
    required super.voteAverage,
    required super.type,
    required super.voteCount,
  });

  factory TvTableModel.formJson(Map<String, dynamic> json) => TvTableModel(
        id: json['id'],
        backdropPath: json[AppStrings.backdropPathTable],
        overview: json[AppStrings.overviewTable],
        posterPath: json[AppStrings.posterPathTable],
        name: json[AppStrings.nameTable],
        firstAirDate: json[AppStrings.firstAirDate],
        lastAirDate: json[AppStrings.lastAirDate],
        type: json[AppStrings.typeTable],
        voteAverage: json[AppStrings.voteAverageTable].toDouble(),
        voteCount: json[AppStrings.voteCountTable],
      );

  Map<String, dynamic> toJson() => {
        AppStrings.idTable: id,
        AppStrings.backdropPathTable: backdropPath,
        AppStrings.overviewTable: overview,
        AppStrings.posterPathTable: posterPath,
        AppStrings.nameTable: name,
        AppStrings.firstAirDate: firstAirDate,
        AppStrings.lastAirDate: lastAirDate,
        AppStrings.typeTable: type,
        AppStrings.voteAverageTable: voteAverage,
        AppStrings.voteCountTable: voteCount,
      };

  factory TvTableModel.formEntity(TvDetailsEntity tvDetails) => TvTableModel(
        id: tvDetails.id,
        backdropPath: tvDetails.backdropPath,
        overview: tvDetails.overview,
        posterPath: tvDetails.posterPath,
        name: tvDetails.name,
        firstAirDate: tvDetails.firstAirDate,
        lastAirDate: tvDetails.lastAirDate,
        type: tvDetails.type,
        voteAverage: tvDetails.voteAverage,
        voteCount: tvDetails.voteCount,
      );
}

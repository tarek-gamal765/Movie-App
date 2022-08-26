import 'package:equatable/equatable.dart';
import 'package:movie_app/tv/domain/entities/tv_season_episode.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/recommendation_tv_entity.dart';
import '../../domain/entities/tv_details_entity.dart';

class TvDetailsState extends Equatable {
  final TvDetailsEntity? tvDetails;
  final RequestStates tvDetailsStates;
  final String tvDetailsMessage;
  final List<RecommendationTvEntity> recommendationTvs;
  final RequestStates recommendationTvsStates;
  final String recommendationTvsMessage;
  final List<TvSeasonEpisode> tvSeasonEpisodes;
  final RequestStates tvSeasonEpisodesStates;
  final String tvSeasonEpisodesMessage;
  final String addedTvToWatchlist;
  final String addedTvToWatchlistMessage;
  final RequestStates addedTvToWatchlistStates;
  final String removeTvFromWatchlist;
  final String removeTvFromWatchlistMessage;
  final RequestStates removeTvFromWatchlistStates;
  final String removeAllTvsFromWatchlist;
  final String removeAllTvsFromWatchlistMessage;
  final RequestStates removeAllTvsFromWatchlistStates;
  final List<TvDetailsEntity> getAllTvsFromWatchlist;
  final String getAllTvsFromWatchlistMessage;
  final RequestStates getAllTvsFromWatchlistStates;
  final bool isTvAddedToWatchlist;

  const TvDetailsState({
    this.tvDetails,
    this.tvDetailsStates = RequestStates.loading,
    this.tvDetailsMessage = AppConstants.empty,
    this.recommendationTvs = const [],
    this.recommendationTvsStates = RequestStates.loading,
    this.recommendationTvsMessage = AppConstants.empty,
    this.tvSeasonEpisodes = const [],
    this.tvSeasonEpisodesStates = RequestStates.loading,
    this.tvSeasonEpisodesMessage = AppConstants.empty,
    this.addedTvToWatchlist = AppConstants.empty,
    this.addedTvToWatchlistMessage = AppConstants.empty,
    this.addedTvToWatchlistStates = RequestStates.loading,
    this.removeTvFromWatchlist = AppConstants.empty,
    this.removeTvFromWatchlistMessage = AppConstants.empty,
    this.removeTvFromWatchlistStates = RequestStates.loading,
    this.removeAllTvsFromWatchlist = AppConstants.empty,
    this.removeAllTvsFromWatchlistMessage = AppConstants.empty,
    this.removeAllTvsFromWatchlistStates = RequestStates.loading,
    this.getAllTvsFromWatchlist = const [],
    this.getAllTvsFromWatchlistMessage = AppConstants.empty,
    this.getAllTvsFromWatchlistStates = RequestStates.loading,
    this.isTvAddedToWatchlist = false,
  });

  TvDetailsState copyWith({
    TvDetailsEntity? tvDetails,
    RequestStates? tvDetailsStates,
    String? tvDetailsMessage,
    List<RecommendationTvEntity>? recommendationTvs,
    RequestStates? recommendationTvsStates,
    String? recommendationTvsMessage,
    List<TvSeasonEpisode>? tvSeasonEpisodes,
    RequestStates? tvSeasonEpisodesStates,
    String? tvSeasonEpisodesMessage,
    String? addedTvToWatchlist,
    String? addedTvToWatchlistMessage,
    RequestStates? addedTvToWatchlistStates,
    String? removeTvFromWatchlist,
    String? removeTvFromWatchlistMessage,
    RequestStates? removeTvFromWatchlistStates,
    String? removeAllTvsFromWatchlist,
    String? removeAllTvsFromWatchlistMessage,
    RequestStates? removeAllTvsFromWatchlistStates,
    List<TvDetailsEntity>? getAllTvsFromWatchlist,
    String?getAllTvsFromWatchlistMessage,
    RequestStates? getAllTvsFromWatchlistStates,
    bool? isTvAddedToWatchlist,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsStates: tvDetailsStates ?? this.tvDetailsStates,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      recommendationTvs: recommendationTvs ?? this.recommendationTvs,
      recommendationTvsStates:
          recommendationTvsStates ?? this.recommendationTvsStates,
      recommendationTvsMessage:
          recommendationTvsMessage ?? this.recommendationTvsMessage,
      tvSeasonEpisodes: tvSeasonEpisodes ?? this.tvSeasonEpisodes,
      tvSeasonEpisodesStates:
          tvSeasonEpisodesStates ?? this.tvSeasonEpisodesStates,
      tvSeasonEpisodesMessage:
          tvSeasonEpisodesMessage ?? this.tvSeasonEpisodesMessage,
      addedTvToWatchlist: addedTvToWatchlist ?? this.addedTvToWatchlist,
      addedTvToWatchlistMessage:
          addedTvToWatchlistMessage ?? this.addedTvToWatchlistMessage,
      addedTvToWatchlistStates:
          addedTvToWatchlistStates ?? this.addedTvToWatchlistStates,
      removeTvFromWatchlist:
          removeTvFromWatchlist ?? this.removeTvFromWatchlist,
      removeTvFromWatchlistMessage:
          removeTvFromWatchlistMessage ?? this.removeTvFromWatchlistMessage,
      removeTvFromWatchlistStates:
          removeTvFromWatchlistStates ?? this.removeTvFromWatchlistStates,
      removeAllTvsFromWatchlist:
          removeAllTvsFromWatchlist ?? this.removeAllTvsFromWatchlist,
      removeAllTvsFromWatchlistMessage: removeAllTvsFromWatchlistMessage ??
          this.removeAllTvsFromWatchlistMessage,
      removeAllTvsFromWatchlistStates: removeAllTvsFromWatchlistStates ??
          this.removeAllTvsFromWatchlistStates,
      getAllTvsFromWatchlist:
          getAllTvsFromWatchlist ?? this.getAllTvsFromWatchlist,
      getAllTvsFromWatchlistMessage:
          getAllTvsFromWatchlistMessage ?? this.getAllTvsFromWatchlistMessage,
      getAllTvsFromWatchlistStates:
          getAllTvsFromWatchlistStates ?? this.getAllTvsFromWatchlistStates,
      isTvAddedToWatchlist: isTvAddedToWatchlist ?? this.isTvAddedToWatchlist,
    );
  }

  @override
  List<Object?> get props => [
        tvDetails,
        tvDetailsStates,
        tvDetailsMessage,
        recommendationTvs,
        recommendationTvsStates,
        recommendationTvsMessage,
        tvSeasonEpisodes,
        tvSeasonEpisodesStates,
        tvSeasonEpisodesMessage,
        addedTvToWatchlist,
        addedTvToWatchlistMessage,
        addedTvToWatchlistStates,
        removeTvFromWatchlist,
        removeTvFromWatchlistMessage,
        removeTvFromWatchlistStates,
        removeAllTvsFromWatchlist,
        removeAllTvsFromWatchlistMessage,
        removeAllTvsFromWatchlistStates,
        getAllTvsFromWatchlist,
        getAllTvsFromWatchlistMessage,
        getAllTvsFromWatchlistStates,
        isTvAddedToWatchlist,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/tv_entity.dart';

class TvsState extends Equatable {
  final List<TvEntity> onTheAirTvs;
  final RequestStates onTheAirTvsStates;
  final String onTheAirTvsMessage;
  final List<TvEntity> popularTvs;
  final RequestStates popularTvsStates;
  final String popularTvsMessage;
  final List<TvEntity> topRatedTvs;
  final RequestStates topRatedTvsStates;
  final String topRatedTvsMessage;

  const TvsState({
    this.onTheAirTvs = const [],
    this.onTheAirTvsStates = RequestStates.loading,
    this.onTheAirTvsMessage = AppConstants.empty,
    this.popularTvs = const [],
    this.popularTvsStates = RequestStates.loading,
    this.popularTvsMessage = AppConstants.empty,
    this.topRatedTvs = const [],
    this.topRatedTvsStates = RequestStates.loading,
    this.topRatedTvsMessage = AppConstants.empty,
  });

  TvsState copyWith({
    List<TvEntity>? onTheAirTvs,
    RequestStates? onTheAirTvsStates,
    String? onTheAirTvsMessage,
    List<TvEntity>? popularTvs,
    RequestStates? popularTvsStates,
    String? popularTvsMessage,
    List<TvEntity>? topRatedTvs,
    RequestStates? topRatedTvsStates,
    String? topRatedTvsMessage,
  }) {
    return TvsState(
      onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
      onTheAirTvsStates: onTheAirTvsStates ?? this.onTheAirTvsStates,
      onTheAirTvsMessage: onTheAirTvsMessage ?? this.onTheAirTvsMessage,
      popularTvs: popularTvs ?? this.popularTvs,
      popularTvsStates: popularTvsStates ?? this.popularTvsStates,
      popularTvsMessage: popularTvsMessage ?? this.popularTvsMessage,
      topRatedTvs: topRatedTvs ?? this.topRatedTvs,
      topRatedTvsStates: topRatedTvsStates ?? this.topRatedTvsStates,
      topRatedTvsMessage: topRatedTvsMessage ?? this.topRatedTvsMessage,
    );
  }

  @override
  List<Object?> get props => [
        onTheAirTvs,
        onTheAirTvsStates,
        onTheAirTvsMessage,
        popularTvs,
        popularTvsStates,
        popularTvsMessage,
        topRatedTvs,
        topRatedTvsStates,
        topRatedTvsMessage,
      ];
}

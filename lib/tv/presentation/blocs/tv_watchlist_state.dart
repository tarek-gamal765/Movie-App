import 'package:equatable/equatable.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/tv_details_entity.dart';

class TvWatchlistState extends Equatable {
  final List<TvDetailsEntity> getAllTvsFromWatchlist;
  final String getAllTvsFromWatchlistMessage;
  final RequestStates getAllTvsFromWatchlistStates;

  const TvWatchlistState({
    this.getAllTvsFromWatchlist = const [],
    this.getAllTvsFromWatchlistMessage = AppConstants.empty,
    this.getAllTvsFromWatchlistStates = RequestStates.loading,
  });

  TvWatchlistState copyWith({
    List<TvDetailsEntity>? getAllTvsFromWatchlist,
    String? getAllTvsFromWatchlistMessage,
    RequestStates? getAllTvsFromWatchlistStates,
  }) {
    return TvWatchlistState(
      getAllTvsFromWatchlist:
          getAllTvsFromWatchlist ?? this.getAllTvsFromWatchlist,
      getAllTvsFromWatchlistMessage:
          getAllTvsFromWatchlistMessage ?? this.getAllTvsFromWatchlistMessage,
      getAllTvsFromWatchlistStates:
          getAllTvsFromWatchlistStates ?? this.getAllTvsFromWatchlistStates,
    );
  }

  @override
  List<Object?> get props => [
        getAllTvsFromWatchlist,
        getAllTvsFromWatchlistMessage,
        getAllTvsFromWatchlistStates,
      ];
}

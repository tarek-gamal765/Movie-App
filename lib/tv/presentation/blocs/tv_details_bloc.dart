import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/tv/domain/usecases/remove_tvs_from_watchlist_use_case.dart';
import 'package:movie_app/tv/presentation/blocs/tv_details_state.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';
import '../../domain/repository/tv_repository.dart';
import '../../domain/usecases/get_recommendation_tvs_usecase.dart';
import '../../domain/usecases/get_tv_details_usecase.dart';
import '../../domain/usecases/get_tv_season_episode_usecase.dart';
import '../../domain/usecases/insert_tv_to_watchlist_usecase.dart';
import '../../domain/usecases/is_tv_added_to_watchlist_usecase.dart';
import '../../domain/usecases/remove_tv_by_id_from_watchlist_usecase.dart';
import 'tv_details_event.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  TvDetailsBloc() : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(getTvDetails);
    on<GetRecommendationTvsEvent>(getRecommendationTvs);
    on<InsertTvToWatchlistEvent>(insertTvToWatchlist);
    on<RemoveTvByIdFromWatchlistEvent>(removeTvByIdFromWatchlist);
    on<RemoveAllTvsFromWatchlistEvent>(removeAllTvsFromWatchlist);
    on<IsTvAddedToWatchlistEvent>(_isTvAddedToWatchlist);
    on<GetTvSeasonEpisodesEvent>(getTvSeasonEpisodes);
  }

  bool _isAddedToWatchlist = false;

  bool get isAddedToWatchlist => _isAddedToWatchlist;

  Future<FutureOr<void>> getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await GetTvDetailsUseCase(di<TvRepository>()).call(event.tvId);
    result.fold((failure) {
      emit(state.copyWith(
        tvDetailsMessage: failure.message,
        tvDetailsStates: RequestStates.error,
      ));
    }, (data) {
      emit(state.copyWith(
        tvDetails: data,
        tvDetailsStates: RequestStates.success,
      ));
    });
  }

  Future<FutureOr<void>> getRecommendationTvs(
      GetRecommendationTvsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await GetRecommendationTvsUseCase(di<TvRepository>()).call(event.tvId);
    result.fold((failure) {
      emit(state.copyWith(
        recommendationTvsMessage: failure.message,
        recommendationTvsStates: RequestStates.error,
      ));
    }, (data) {
      emit(state.copyWith(
        recommendationTvs: data,
        recommendationTvsStates: RequestStates.success,
      ));
    });
  }

  Future<FutureOr<void>> getTvSeasonEpisodes(
      GetTvSeasonEpisodesEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await GetTvSeasonEpisodesUseCase(di<TvRepository>()).call(event.params);
    result.fold((failure) {
      emit(state.copyWith(
        tvSeasonEpisodesMessage: failure.message,
        tvSeasonEpisodesStates: RequestStates.error,
      ));
    }, (data) {
      emit(state.copyWith(
        tvSeasonEpisodes: data,
        tvSeasonEpisodesStates: RequestStates.success,
      ));
    });
  }

  Future<FutureOr<void>> insertTvToWatchlist(
      InsertTvToWatchlistEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await InsertTvToWatchlistUseCase(di<TvRepository>()).call(event.tv);
    result.fold((failure) {
      emit(state.copyWith(
        addedTvToWatchlistMessage: failure.message,
        addedTvToWatchlistStates: RequestStates.error,
      ));
    }, (data) async {
      emit(state.copyWith(
        addedTvToWatchlist: data,
        addedTvToWatchlistStates: RequestStates.success,
      ));
    });
  }

  Future<FutureOr<void>> removeTvByIdFromWatchlist(
      RemoveTvByIdFromWatchlistEvent event,
      Emitter<TvDetailsState> emit) async {
    final result = await RemoveTvByIdFromWatchlistUseCase(di<TvRepository>())
        .call(event.tv);
    result.fold((failure) {
      emit(state.copyWith(
        removeTvFromWatchlistMessage: failure.message,
        removeTvFromWatchlistStates: RequestStates.error,
      ));
    }, (data) async {
      emit(state.copyWith(
        removeTvFromWatchlist: data,
        removeTvFromWatchlistStates: RequestStates.success,
      ));
    });
  }

  Future<FutureOr<void>> removeAllTvsFromWatchlist(
      RemoveAllTvsFromWatchlistEvent event,
      Emitter<TvDetailsState> emit) async {
    on<RemoveAllTvsFromWatchlistEvent>((event, emit) async {
      final result = await RemoveTvsFromWatchlistUseCase(di<TvRepository>())
          .call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          removeAllTvsFromWatchlistMessage: failure.message,
          removeAllTvsFromWatchlistStates: RequestStates.error,
        ));
      }, (data) async {
        emit(state.copyWith(
          removeAllTvsFromWatchlist: data,
          removeAllTvsFromWatchlistStates: RequestStates.success,
        ));
      });
    });
  }

  Future<FutureOr<void>> _isTvAddedToWatchlist(
      IsTvAddedToWatchlistEvent event, Emitter<TvDetailsState> emit) async {
    bool result =
        await IsTvAddedToWatchlistUseCase(di<TvRepository>()).call(event.tvId);
    _isAddedToWatchlist = result;
    emit(state.copyWith(isTvAddedToWatchlist: result));
  }
}

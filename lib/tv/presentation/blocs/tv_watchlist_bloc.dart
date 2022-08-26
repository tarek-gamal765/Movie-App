import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/tv/presentation/blocs/tv_watchlist_state.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';
import '../../domain/repository/tv_repository.dart';
import '../../domain/usecases/get_tvs_from_watchlist_usecase.dart';

part 'tv_watchlist_event.dart';

class TvWatchlistBloc extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  TvWatchlistBloc() : super(const TvWatchlistState()) {
    on<GetAllTvsFromWatchlistEvent>(getAllTvsFromWatchlist);
  }

  Future<FutureOr<void>> getAllTvsFromWatchlist(
      GetAllTvsFromWatchlistEvent event, Emitter<TvWatchlistState> emit) async {
    final result =
        await GetTvsFromWatchlistUseCase(di<TvRepository>()).call(NoPrams());
    result.fold((failure) {
      emit(state.copyWith(
        getAllTvsFromWatchlistMessage: failure.message,
        getAllTvsFromWatchlistStates: RequestStates.error,
      ));
    }, (data) async {
      emit(state.copyWith(
        getAllTvsFromWatchlist: data,
        getAllTvsFromWatchlistStates: RequestStates.success,
      ));
    });
  }
}

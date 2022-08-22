
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/dependency_injection.dart';
import 'package:movie_app/tv/domain/repository/tv_repository.dart';
import 'package:movie_app/tv/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:movie_app/tv/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:movie_app/tv/presentation/blocs/tvs_event.dart';
import 'package:movie_app/tv/presentation/blocs/tvs_state.dart';

class TvsBloc extends Bloc<TvsEvent, TvsState> {
  TvsBloc() : super(const TvsState()) {
    getNowPlayingTvs();
    getPopularTvs();
    getTopRatedTvs();
  }

  void getNowPlayingTvs() {
    on<GetNowPlayingTvsEvent>((event, emit) async {
      final result =
          await GetNowPlayingTvsUseCase(di<TvRepository>()).call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          onTheAirTvsMessage: failure.message,
          onTheAirTvsStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          onTheAirTvs: data,
          onTheAirTvsStates: RequestStates.success,
        ));
      });
    });
  }

  void getPopularTvs() {
    on<GetPopularTvsEvent>((event, emit) async {
      final result =
          await GetPopularTvsUseCase(di<TvRepository>()).call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          popularTvsMessage: failure.message,
          popularTvsStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          popularTvs: data,
          popularTvsStates: RequestStates.success,
        ));
      });
    });
  }

  void getTopRatedTvs() {
    on<GetTopRatedTvsEvent>((event, emit) async {
      final result =
          await GetTopRatedTvsUseCase(di<TvRepository>()).call(NoPrams());
      result.fold((failure) {
        emit(state.copyWith(
          topRatedTvsMessage: failure.message,
          topRatedTvsStates: RequestStates.error,
        ));
      }, (data) {
        emit(state.copyWith(
          topRatedTvs: data,
          topRatedTvsStates: RequestStates.success,
        ));
      });
    });
  }
}

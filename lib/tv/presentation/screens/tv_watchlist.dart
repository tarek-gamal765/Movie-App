import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import 'package:movie_app/tv/presentation/blocs/tv_watchlist_bloc.dart';
import 'package:movie_app/tv/presentation/blocs/tv_watchlist_state.dart';

import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';

class TvWatchlist extends StatelessWidget {
  const TvWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvWatchlistBloc>(
      create: (context) => di<TvWatchlistBloc>()
        ..add(
          const GetAllTvsFromWatchlistEvent(),
        ),
      child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
        builder: (context, state) {
          switch (state.getAllTvsFromWatchlistStates) {
            case RequestStates.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestStates.success:
              return ListView.builder(
                itemCount: state.getAllTvsFromWatchlist.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return CardItem(
                    title: state.getAllTvsFromWatchlist[index].name,
                    imageUrl: state.getAllTvsFromWatchlist[index].posterPath,
                    voteAverage:
                        state.getAllTvsFromWatchlist[index].voteAverage,
                    releaseDate:
                        state.getAllTvsFromWatchlist[index].firstAirDate,
                    overview: state.getAllTvsFromWatchlist[index].overview,
                  );
                },
              );
            case RequestStates.error:
              return Center(
                child: Text(state.getAllTvsFromWatchlistMessage),
              );
          }
        },
      ),
    );
  }
}

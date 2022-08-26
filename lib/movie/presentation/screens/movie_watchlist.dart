import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import '../../../core/utils/enums.dart';
import '../../../dependency_injection.dart';
import '../blocs/movie_watchlist_bloc.dart';
import '../blocs/movie_watchlist_state.dart';

class MovieWatchlist extends StatelessWidget {
  const MovieWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MovieWatchlistBloc>()
        ..add(
          const GetAllMoviesFromWatchlistEvent(),
        ),
      child: BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
        builder: (context, state) {
          switch (state.getAllMoviesFromWatchlistStates) {
            case RequestStates.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestStates.success:
              return ListView.builder(
                itemCount: state.getAllMoviesFromWatchlist.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return CardItem(
                    title: state.getAllMoviesFromWatchlist[index].title,
                    imageUrl: state.getAllMoviesFromWatchlist[index].posterPath,
                    voteAverage:
                        state.getAllMoviesFromWatchlist[index].voteAverage,
                    releaseDate:
                        state.getAllMoviesFromWatchlist[index].releaseDate,
                    overview: state.getAllMoviesFromWatchlist[index].overview,
                  );
                },
              );
            case RequestStates.error:
              return Center(
                child: Text(state.getAllMoviesFromWatchlistMessage),
              );
          }
        },
      ),
    );
  }
}

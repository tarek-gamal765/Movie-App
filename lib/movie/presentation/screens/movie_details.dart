import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/recommendation_title.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_app_bar_image_widget.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_details_content_widget.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/dependency_injection.dart';
import 'package:movie_app/movie/presentation/blocs/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/components/recommendation_movies_component.dart';

import '../blocs/movie_details_event.dart';
import '../blocs/movie_details_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;

  const MovieDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(widget.id))
          ..add(GetRecommendationMoviesEvent(widget.id))
          ..add(IsMovieAddedToWatchlistEvent(widget.id)),
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
          if (state.movieDetailsStates == RequestStates.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.movieDetailsStates == RequestStates.success) {
            var movieDetailsBloc = BlocProvider.of<MovieDetailsBloc>(context);
            return CustomScrollView(
              slivers: [
                SliverAppBarImageWidget(
                  imageUrl: state.movieDetails!.posterPath,
                ),
                SliverDetailsContentWidget(
                  title: state.movieDetails!.title,
                  overview: state.movieDetails!.overview,
                  releaseDate: state.movieDetails!.releaseDate,
                  voteAverage: state.movieDetails!.voteAverage,
                  onPressed: () {
                    if (movieDetailsBloc.isAddedToWatchlist) {
                      movieDetailsBloc.add(
                          RemoveMoviesFromWatchlistEvent(state.movieDetails!));
                    } else {
                      movieDetailsBloc.add(
                          InsertMovieToWatchlistEvent(state.movieDetails!));
                    }
                    movieDetailsBloc.add(
                        IsMovieAddedToWatchlistEvent(state.movieDetails!.id));
                  },
                  addToWatchlist: movieDetailsBloc.isAddedToWatchlist
                      ? 'Added to watchlist'
                      : 'Add to watchlist',
                ),
                const RecommendationTitle(),
                BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                  builder: (context, recommendationState) {
                    return RecommendationMoviesComponent(
                      recommendationList: state.recommendationMovies,
                    );
                  },
                ),
              ],
            );
          } else {
            return const Text('loading data failed');
          }
        }),
      ),
    );
  }
}

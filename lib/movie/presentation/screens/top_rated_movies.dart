import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_content.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        if (state.topRatedMoviesStates == RequestStates.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.topRatedMoviesStates == RequestStates.success) {
          return FadeIn(
            duration: const Duration(milliseconds: AppConstants.fadeDuration),
            child: ListView.builder(
              itemCount: state.topRatedMovies.length,
              itemBuilder: (context, index) {
                return BottomSheetContent(
                  imageUrl: state.topRatedMovies[index].posterPath,
                  title: state.topRatedMovies[index].title,
                  overview: state.topRatedMovies[index].overview,
                  releaseDate: state.topRatedMovies[index].releaseDate,
                  voteAverage: state.topRatedMovies[index].voteAverage,
                  isBottomSheet: false,
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('Loading data failed'),
          );
        }
      }),
    );
  }
}

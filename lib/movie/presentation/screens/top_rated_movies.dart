import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/routes.dart';

import 'package:movie_app/core/global/lib/presentation/common_widgets/popular_and_top_rated_item.dart';
import '../../../core/global/styles/app_colors/app_colors_dark.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/urls.dart';
import '../../../core/utils/values_manager.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.topRatedMovies,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p4,
                    horizontal: AppPadding.p10,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.movieDetailsRoute,
                      arguments: state.topRatedMovies[index].id,
                    ),
                    child: PopularAndTopRatedItem(
                      imageUrl:
                          Urls.imageUrl(state.topRatedMovies[index].posterPath),
                      title: state.topRatedMovies[index].title,
                      overview: state.topRatedMovies[index].overview,
                      releaseDate: state.topRatedMovies[index].releaseDate,
                      voteAverage: state.topRatedMovies[index].voteAverage,
                      color: AppColorsDark.lightBlackColor,
                    ),
                  ),
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

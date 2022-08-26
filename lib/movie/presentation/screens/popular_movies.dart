import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/values_manager.dart';

import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import '../../../core/global/styles/app_colors/app_colors_dark.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/routes.dart';
import '../../../core/utils/urls.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.popularMovies,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        if (state.popularMoviesStates == RequestStates.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.popularMoviesStates == RequestStates.success) {
          return FadeIn(
            duration: const Duration(milliseconds: AppConstants.fadeDuration),
            child: ListView.builder(
              itemCount: state.popularMovies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p4,
                    horizontal: AppPadding.p10,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.movieDetailsRoute,
                        arguments: state.popularMovies[index].id,
                      );
                    },
                    child: CardItem(
                      imageUrl: Urls.imageUrl(state.popularMovies[index].posterPath),
                      title: state.popularMovies[index].title,
                      overview: state.popularMovies[index].overview,
                      releaseDate: state.popularMovies[index].releaseDate,
                      voteAverage: state.popularMovies[index].voteAverage,
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

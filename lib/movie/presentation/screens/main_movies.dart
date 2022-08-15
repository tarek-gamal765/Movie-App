import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/title_and_see_more_widget.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/movie/presentation/components/now_playing_movies_component.dart';
import 'package:movie_app/movie/presentation/components/popular_movies_component.dart';
import 'package:movie_app/movie/presentation/components/top_rated_movies_component.dart';

import '../../../core/utils/app_strings.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const NowPlayingMoviesComponent(),
          const SizedBox(height: AppSize.s20),
          SubTitleAndSeeMore(
            text: AppStrings.popular,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.popularMoviesRoute),
          ),
          const PopularMoviesComponent(),
          const SizedBox(height: AppSize.s20),
          SubTitleAndSeeMore(
            text: AppStrings.topRated,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.topRatedMoviesRoute),
          ),
          const TopRatedMoviesComponent(),
          const SizedBox(height: AppSize.s20),
        ],
      ),
    );
  }
}

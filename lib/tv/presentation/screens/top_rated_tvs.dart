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
import '../blocs/Tvs_bloc.dart';
import '../blocs/tvs_state.dart';

class TopRatedTvsScreen extends StatelessWidget {
  const TopRatedTvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.topRatedTvs,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: BlocBuilder<TvsBloc, TvsState>(builder: (context, state) {
        if (state.topRatedTvsStates == RequestStates.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.topRatedTvsStates == RequestStates.success) {
          return FadeIn(
            duration: const Duration(milliseconds: AppConstants.fadeDuration),
            child: ListView.builder(
              itemCount: state.topRatedTvs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p4,
                    horizontal: AppPadding.p10,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.tvDetailsRoute,
                        arguments: state.topRatedTvs[index].id,
                      );
                    },
                    child: PopularAndTopRatedItem(
                      imageUrl:
                          Urls.imageUrl(state.topRatedTvs[index].posterPath),
                      title: state.topRatedTvs[index].name,
                      overview: state.topRatedTvs[index].overview,
                      releaseDate: state.topRatedTvs[index].firstAirDate,
                      voteAverage: state.topRatedTvs[index].voteAverage,
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

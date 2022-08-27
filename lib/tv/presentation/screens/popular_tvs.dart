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
import '../blocs/Tvs_bloc.dart';
import '../blocs/tvs_state.dart';

class PopularTvsScreen extends StatelessWidget {
  const PopularTvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.popularTvs,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: BlocBuilder<TvsBloc, TvsState>(builder: (context, state) {
        if (state.popularTvsStates == RequestStates.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.popularTvsStates == RequestStates.success) {
          return FadeIn(
            duration: const Duration(milliseconds: AppConstants.fadeDuration),
            child: ListView.builder(
              itemCount: state.popularTvs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p4,
                    horizontal: AppPadding.p10,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      Routes.tvDetailsRoute,
                      arguments: state.popularTvs[index].id,
                    ),
                    child: CardItem(
                      imageUrl: Urls.imageUrl(state.popularTvs[index].posterPath)
                        ,
                      title: state.popularTvs[index].name,
                      overview: state.popularTvs[index].overview,
                      releaseDate: state.popularTvs[index].firstAirDate,
                      voteAverage: state.popularTvs[index].voteAverage,
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

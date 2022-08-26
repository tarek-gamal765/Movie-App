import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/loading_widget.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/urls.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/tv/presentation/blocs/Tvs_bloc.dart';
import 'package:movie_app/tv/presentation/blocs/tvs_state.dart';

import '../../../core/utils/routes.dart';

class TopRatedTvsComponent extends StatelessWidget {
  const TopRatedTvsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BlocBuilder<TvsBloc, TvsState>(builder: (context, state) {
        if (state.topRatedTvsStates == RequestStates.loading) {
          return SizedBox(
            height: AppSize.s160,
            width: AppSize.s120,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppSize.s5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: AppPadding.p8),
                  child: LoadingWidget(
                    height: AppSize.s160,
                    width: AppSize.s120,
                  ),
                );
              },
            ),
          );
        } else if (state.topRatedTvsStates == RequestStates.success) {
          return ListView.builder(
              itemCount: state.topRatedTvs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: AppPadding.p8,
                  ),
                  child: InkWell(
                    onTap: () {
                      showBottomSheetDetails(
                        context: context,
                        imageUrl:
                            Urls.imageUrl(state.topRatedTvs[index].posterPath),
                        title: state.topRatedTvs[index].name,
                        overview: state.topRatedTvs[index].overview,
                        releaseDate: state.topRatedTvs[index].firstAirDate,
                        voteAverage: state.topRatedTvs[index].voteAverage,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            Routes.tvDetailsRoute,
                            arguments: state.topRatedTvs[index].id,
                          );
                        },
                      );
                    },
                    child: ImageItem(
                      imageUrl:
                          Urls.imageUrl(state.topRatedTvs[index].posterPath),
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: Text('Load data failed'),
          );
        }
      }),
    );
  }
}

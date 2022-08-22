import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/loading_widget.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/tv/presentation/blocs/Tvs_bloc.dart';
import 'package:movie_app/tv/presentation/blocs/tvs_state.dart';

import '../../../core/utils/routes.dart';
import '../../../core/utils/urls.dart';

class PopularTvsComponent extends StatelessWidget {
  const PopularTvsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BlocBuilder<TvsBloc, TvsState>(builder: (context, state) {
        if (state.popularTvsStates == RequestStates.loading) {
          return SizedBox(
            height: AppSize.s160,
            width: AppSize.s120,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppSize.s5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: AppPadding.p10),
                  child: LoadingWidget(
                    height: AppSize.s160,
                    width: AppSize.s120,
                  ),
                );
              },
            ),
          );
        } else if (state.popularTvsStates == RequestStates.success) {
          return ListView.builder(
              itemCount: state.popularTvs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showBottomSheetDetails(
                      context: context,
                      imageUrl:
                          Urls.imageUrl(state.popularTvs[index].posterPath),
                      title: state.popularTvs[index].name,
                      overview: state.popularTvs[index].overview,
                      releaseDate: state.popularTvs[index].firstAirDate,
                      voteAverage: state.popularTvs[index].voteAverage,
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(
                          Routes.tvDetailsRoute,
                          arguments: state.popularTvs[index].id,
                        );
                      },
                    );
                  },
                  child: CardItem(
                    imageUrl: Urls.imageUrl(state.popularTvs[index].posterPath),
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

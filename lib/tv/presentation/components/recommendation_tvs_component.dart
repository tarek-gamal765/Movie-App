import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/urls.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import '../../../core/utils/routes.dart';
import '../../domain/entities/recommendation_tv_entity.dart';

class RecommendationTvsComponent extends StatelessWidget {
  final List<RecommendationTvEntity> recommendationList;

  const RecommendationTvsComponent({
    Key? key,
    required this.recommendationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding:
        const EdgeInsets.fromLTRB(AppSize.s12, AppSize.s0, AppSize.s12, AppSize.s12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return FadeInUp(
              from: AppSize.s20,
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  showBottomSheetDetails(
                    context: context,
                    imageUrl: recommendationList[index].posterPath != null
                        ? Urls.imageUrl(recommendationList[index].posterPath!)
                        : AppConstants.defaultImage,
                    title: recommendationList[index].name,
                    overview: recommendationList[index].overview,
                    releaseDate: recommendationList[index].firstAirDate,
                    voteAverage: recommendationList[index].voteAverage,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(
                        Routes.tvDetailsRoute,
                        arguments: recommendationList[index].id,
                      );
                    },
                  );
                },
                child: ImageItem(
                  imageUrl: recommendationList[index].posterPath != null
                      ? Urls.imageUrl(recommendationList[index].posterPath!)
                      : AppConstants.defaultImage,
                ),
              ),
            );
          },
          childCount: recommendationList.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: AppSize.s8,
          crossAxisSpacing:AppSize.s8,
          childAspectRatio: AppSize.s0_7,
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? AppSize.s3.toInt()
                  : AppSize.s4.toInt(),
        ),
      ),
    );
  }
}

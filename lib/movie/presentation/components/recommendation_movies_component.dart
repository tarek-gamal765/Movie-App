import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/routes.dart';
import '../../../core/utils/urls.dart';
import '../../../core/utils/values_manager.dart';
import '../../domain/entities/recommendation_movie_entity.dart';

class RecommendationMoviesComponent extends StatelessWidget {
  final List<RecommendationMovieEntity> recommendationList;

  const RecommendationMoviesComponent({
    Key? key,
    required this.recommendationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: AppPadding.p10,
        bottom: AppPadding.p10,
        right: AppPadding.p10,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  showBottomSheetDetails(
                    context: context,
                    imageUrl:
                        Urls.imageUrl(recommendationList[index].posterPath!),
                    title: recommendationList[index].title,
                    overview: recommendationList[index].overview,
                    releaseDate: recommendationList[index].releaseDate,
                    voteAverage: recommendationList[index].voteAverage,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(
                        Routes.movieDetailsRoute,
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
          mainAxisSpacing: 8.0,
          // crossAxisSpacing: 8.0,
          childAspectRatio: 0.8,
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 3
                  : 4,
        ),
      ),
    );
  }
}

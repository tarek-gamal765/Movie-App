import 'package:flutter/material.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/routes.dart';
import '../../../../utils/values_manager.dart';
import 'bottom_sheet_content.dart';

Future showBottomSheetDetails({
  required BuildContext context,
  required int id,
  required String imageUrl,
  required String title,
  required String overview,
  required String releaseDate,
  required double voteAverage,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSize.s10),
        topRight: Radius.circular(AppSize.s10),
      ),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: AppSize.s300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BottomSheetContent(
              imageUrl: imageUrl,
              title: title,
              overview: overview,
              releaseDate: releaseDate,
              voteAverage: voteAverage,
              isBottomSheet: true,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(
                    Routes.movieDetailsRoute,
                    arguments: id,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColorsDark.whiteColor,
                      size: AppSize.s14,
                    ),
                    const SizedBox(width: AppSize.s8),
                    Text(
                      AppStrings.detailsAndMore,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColorsDark.whiteColor,
                      size: AppSize.s14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

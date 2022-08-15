import 'package:flutter/material.dart';

import '../../../../utils/values_manager.dart';
import '../../../styles/app_colors/app_colors_dark.dart';


class SliverDetailsContentWidget extends StatelessWidget {
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final VoidCallback onPressed;
  final String addToWatchlist;

  const SliverDetailsContentWidget({
    Key? key,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.onPressed,
    required this.addToWatchlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
              maxLines: AppSize.s2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSize.s10),
            Row(
              children: [
                Text(
                  releaseDate.split('-').first,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        backgroundColor: AppColorsDark.lightGreyColor
                            .withOpacity(AppSize.s0_1),
                      ),
                ),
                const SizedBox(width: AppSize.s16),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: AppSize.s20,
                      color: AppColorsDark.yellowColor,
                    ),
                    const SizedBox(width: AppSize.s4),
                    Text('$voteAverage'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            MaterialButton(
              color: AppColorsDark.whiteColor,
              splashColor: AppColorsDark.lightGreyColor,
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(addToWatchlist),
                  const SizedBox(width: AppSize.s4),
                  const Icon(Icons.add),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              overview,
              maxLines: AppSize.s4.toInt(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

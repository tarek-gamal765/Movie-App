import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/urls.dart';

import '../../../../utils/values_manager.dart';
import '../../../styles/app_colors/app_colors_dark.dart';
import 'image_item.dart';

class CardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final Color color;

  const CardItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    this.color = AppColorsDark.transparentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      padding: const EdgeInsets.only(
        top: AppSize.s10,
        bottom: AppSize.s10,
        right: AppSize.s10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageItem(imageUrl: Urls.imageUrl(imageUrl)),
          const SizedBox(width: AppSize.s10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: AppSize.s3,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s8),
                Row(
                  children: [
                    Text(
                      releaseDate.split('-').first,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            backgroundColor: AppColorsDark.redAccentColor,
                          ),
                    ),
                    const SizedBox(width: AppSize.s10),
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
                const SizedBox(height: AppSize.s8),
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
        ],
      ),
    );
  }
}

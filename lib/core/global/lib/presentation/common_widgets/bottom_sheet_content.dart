import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/values_manager.dart';

class BottomSheetContent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final Color color;

  const BottomSheetContent({
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
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageItem(imageUrl: imageUrl),
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
                    Expanded(
                      flex: AppSize.s1.toInt(),
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .hoverColor
                              .withOpacity(AppSize.s0_1),
                        ),
                        child: IconButton(
                          splashRadius: AppSize.s20,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s8),
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

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/font_manager.dart';
import 'package:movie_app/core/utils/urls.dart';

import '../../../core/utils/values_manager.dart';
import '../../domain/entities/tv_season_episode.dart';

class SeasonEpisodesComponent extends StatelessWidget {
  final List<TvSeasonEpisode> tvSeasonEpisodes;

  const SeasonEpisodesComponent({
    Key? key,
    required this.tvSeasonEpisodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tvSeasonEpisodes.isEmpty
        ? const SliverPadding(
            padding: EdgeInsets.fromLTRB(
                AppSize.s12, AppSize.s0, AppSize.s12, AppSize.s12),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  AppStrings.comingSoon,
                  style: TextStyle(fontSize: FontSize.s14),
                ),
              ),
            ),
          )
        : SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                AppSize.s12, AppSize.s0, AppSize.s12, AppSize.s12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  TvSeasonEpisode seasonEpisode = tvSeasonEpisodes[index];
                  return FadeInUp(
                    from: AppSize.s20,
                    duration: const Duration(
                        milliseconds: AppConstants.animationDuration500),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: AppMargin.m20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ImageItem(
                                  imageUrl: seasonEpisode.stillPath != null
                                      ? Urls.imageUrl(
                                          seasonEpisode.stillPath!)
                                      : AppConstants.defaultImage,
                                ),
                              ),
                              const SizedBox(width: AppSize.s12),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: AppSize.sMax,
                                      child: Text(
                                        '${seasonEpisode.episodeNumber}. ${seasonEpisode.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      seasonEpisode.airDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color: AppColorsDark.greyColor,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p8),
                            child: Text(
                              seasonEpisode.overview,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: tvSeasonEpisodes.length,
              ),
            ),
          );
  }
}

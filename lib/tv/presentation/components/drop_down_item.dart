import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/font_manager.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/values_manager.dart';
import '../../domain/usecases/get_tv_season_episode_usecase.dart';
import '../blocs/tv_details_bloc.dart';
import '../blocs/tv_details_event.dart';

class DropDownItem extends StatefulWidget {
  final int numOfSeasons;
  final int tvId;

  const DropDownItem({
    Key? key,
    required this.numOfSeasons,
    required this.tvId,
  }) : super(key: key);

  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  int _currentSeason = 1;
  List<int> seasons = [];

  @override
  void initState() {
    for (int i = 1; i <= widget.numOfSeasons; i++) {
      seasons.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSize.s12,
        AppSize.s0,
        AppSize.s12,
        AppSize.s12,
      ),
      sliver: SliverToBoxAdapter(
        child: FadeIn(
          duration: const Duration(
            milliseconds: AppConstants.animationDuration500,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[AppSize.s850],
              borderRadius: BorderRadius.circular(AppSize.s4),
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<int>(
                  onChanged: (value) {
                    setState(() {
                      _currentSeason = value!;
                    });
                    BlocProvider.of<TvDetailsBloc>(
                      context,
                    ).add(
                      GetTvSeasonEpisodesEvent(
                        Params(widget.tvId, value!),
                      ),
                    );
                  },
                  items: seasons
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            '${AppStrings.season} $item',
                            style: Theme.of(context).textTheme.subtitle2
                          ),
                        ),
                      )
                      .toList(),
                  value: _currentSeason,
                  style: const TextStyle(
                    fontSize: FontSize.s16,
                    letterSpacing: AppSize.s1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

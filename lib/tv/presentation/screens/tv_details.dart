import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_app_bar_image_widget.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_details_content_widget.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/tv/presentation/blocs/tv_details_bloc.dart';
import 'package:movie_app/tv/presentation/components/drop_down_item.dart';
import 'package:movie_app/tv/presentation/components/season_episodes_component.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/urls.dart';
import '../../../core/utils/values_manager.dart';
import '../../../dependency_injection.dart';
import '../../domain/usecases/get_tv_season_episode_usecase.dart';
import '../blocs/tv_details_event.dart';
import '../blocs/tv_details_state.dart';
import '../components/recommendation_tvs_component.dart';

class TvDetailsScreen extends StatefulWidget {
  final int id;

  const TvDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TvDetailsScreen> createState() => _TvDetailsScreenState();
}

class _TvDetailsScreenState extends State<TvDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        di<TvDetailsBloc>()
          ..add(GetTvDetailsEvent(widget.id))..add(
            GetRecommendationTvsEvent(widget.id))..add(
            IsTvAddedToWatchlistEvent(widget.id))..add(
            GetTvSeasonEpisodesEvent(Params(widget.id, 1))),
        child: BlocBuilder<TvDetailsBloc, TvDetailsState>(
            builder: (context, state) {
              var tvDetailsBloc = BlocProvider.of<TvDetailsBloc>(context);
              if (state.tvDetailsStates == RequestStates.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.tvDetailsStates == RequestStates.success) {
                _tabController.addListener(() {
                  if (!_tabController.indexIsChanging) {
                    setState(() {
                      _selectedIndex = _tabController.index;
                    });
                  }
                });
                return CustomScrollView(
                  slivers: [
                    SliverAppBarImageWidget(
                        imageUrl: Urls.imageUrl(state.tvDetails!.posterPath)),
                    SliverDetailsContentWidget(
                      title: state.tvDetails!.name,
                      overview: state.tvDetails!.overview,
                      releaseDate: state.tvDetails!.firstAirDate,
                      voteAverage: state.tvDetails!.voteAverage,
                      onPressed: () {
                        if (tvDetailsBloc.isAddedToWatchlist) {
                          tvDetailsBloc.add(
                              RemoveTvByIdFromWatchlistEvent(state.tvDetails!));
                        } else {
                          tvDetailsBloc
                              .add(InsertTvToWatchlistEvent(state.tvDetails!));
                        }
                        tvDetailsBloc
                            .add(IsTvAddedToWatchlistEvent(state.tvDetails!
                            .id));
                      },
                      addToWatchlist: tvDetailsBloc.isAddedToWatchlist
                          ? AppStrings.removeFromWatchlist
                          : AppStrings.addToWatchlist,
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      sliver: SliverToBoxAdapter(
                        child: FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: TabBar(
                            controller: _tabController,
                            indicator: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: AppColorsDark.redAccentColor,
                                  style: BorderStyle.solid,
                                  width: AppSize.s4,
                                ),
                              ),
                            ),
                            tabs: const [
                              Tab(text: AppStrings.episodes),
                              Tab(text: AppStrings.moreLikeThis),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _selectedIndex == 0
                        ? DropDownItem(
                      numOfSeasons: state.tvDetails!.numOfSeason,
                      tvId: widget.id,
                    )
                        : const SliverToBoxAdapter(),
                    _selectedIndex == 0
                        ? BlocBuilder<TvDetailsBloc, TvDetailsState>(
                      buildWhen: (previous, current)=> previous != current,
                      builder: (context, state) {
                        return SeasonEpisodesComponent(
                          tvSeasonEpisodes: state.tvSeasonEpisodes,
                        );
                      },
                    )
                        : RecommendationTvsComponent(
                      recommendationList: state.recommendationTvs,
                    ),
                  ],
                );
              } else {
                return const Text('loading data failed');
              }
            }),
      ),
    );
  }
}

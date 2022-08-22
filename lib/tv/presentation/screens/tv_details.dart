import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/core/global/lib/presentation/common_widgets/recommendation_title.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_app_bar_image_widget.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/sliver_details_content_widget.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/tv/presentation/blocs/tv_details_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/urls.dart';
import '../../../dependency_injection.dart';
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

class _TvDetailsScreenState extends State<TvDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<TvDetailsBloc>()
          ..add(GetTvDetailsEvent(widget.id))
          ..add(GetRecommendationTvsEvent(widget.id))
          ..add(IsTvAddedToWatchlistEvent(widget.id)),
        child: BlocBuilder<TvDetailsBloc, TvDetailsState>(
            builder: (context, state) {
          var tvDetailsBloc = BlocProvider.of<TvDetailsBloc>(context);
          if (state.tvDetailsStates == RequestStates.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.tvDetailsStates == RequestStates.success) {
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
                        .add(IsTvAddedToWatchlistEvent(state.tvDetails!.id));
                  },
                  addToWatchlist: tvDetailsBloc.isAddedToWatchlist
                      ? AppStrings.removeFromWatchlist
                      : AppStrings.addToWatchlist,
                ),
                const RecommendationTitle(),
                BlocBuilder<TvDetailsBloc, TvDetailsState>(
                  builder: (context, recommendationState) {
                    return RecommendationTvsComponent(
                      recommendationList: state.recommendationTvs,
                    );
                  },
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

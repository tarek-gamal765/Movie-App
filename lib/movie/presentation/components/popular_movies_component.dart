import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/loading_widget.dart';
import 'package:movie_app/core/utils/values_manager.dart';

import '../../../core/utils/enums.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        if (state.popularMoviesStates == RequestStates.loading) {
          return SizedBox(
            height: AppSize.s160,
            width: AppSize.s120,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppSize.s5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: AppPadding.p10),
                  child: LoadingWidget(
                    height: AppSize.s160,
                    width: AppSize.s120,
                  ),
                );
              },
            ),
          );
        } else if (state.popularMoviesStates == RequestStates.success) {
          return ListView.builder(
              itemCount: state.popularMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showBottomSheetDetails(
                      context:context,
                      id: state.popularMovies[index].id,
                      imageUrl: state.popularMovies[index].posterPath,
                      title: state.popularMovies[index].title,
                      overview: state.popularMovies[index].overview,
                      releaseDate: state.popularMovies[index].releaseDate,
                      voteAverage: state.popularMovies[index].voteAverage,
                    );
                  },
                  child: CardItem(
                    imageUrl: state.popularMovies[index].posterPath,
                  ),
                );
              });
        } else {
          return const Center(
            child: Text('Load data failed'),
          );
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/image_item.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/loading_widget.dart';
import 'package:movie_app/core/utils/values_manager.dart';

import '../../../core/utils/enums.dart';
import '../../../core/utils/routes.dart';
import '../../../core/utils/urls.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
        if (state.topRatedMoviesStates == RequestStates.loading) {
          return SizedBox(
            height: AppSize.s160,
            width: AppSize.s120,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppSize.s5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: AppPadding.p8),
                  child: LoadingWidget(
                    height: AppSize.s160,
                    width: AppSize.s120,
                  ),
                );
              },
            ),
          );
        } else if (state.topRatedMoviesStates == RequestStates.success) {
          return ListView.builder(
              itemCount: state.topRatedMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: AppPadding.p8,
                  ),
                  child: InkWell(
                    onTap: () {
                      showBottomSheetDetails(
                        context: context,
                        imageUrl: state.topRatedMovies[index].posterPath,
                        title: state.topRatedMovies[index].title,
                        overview: state.topRatedMovies[index].overview,
                        releaseDate: state.topRatedMovies[index].releaseDate,
                        voteAverage: state.topRatedMovies[index].voteAverage,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            Routes.movieDetailsRoute,
                            arguments: state.topRatedMovies[index].id,
                          );
                        },
                      );
                    },
                    child: ImageItem(
                      imageUrl:
                          Urls.imageUrl(state.topRatedMovies[index].posterPath),
                    ),
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

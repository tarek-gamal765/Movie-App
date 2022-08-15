import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/bottom_sheet_details.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/loading_widget.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/urls.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movies_state.dart';

class NowPlayingMoviesComponent<T> extends StatelessWidget {
  const NowPlayingMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(builder: (context, state) {
      if (state.nowPlayingMoviesStates == RequestStates.success) {
        return SizedBox(
          height: AppSize.s500,
          child: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: AppSize.s400,
                viewportFraction: 1.0,
              ),
              items: state.nowPlayingMovies.map(
                (item) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheetDetails(
                        context: context,
                        id: item.id,
                        imageUrl: item.posterPath,
                        title: item.title,
                        overview: item.overview,
                        releaseDate: item.releaseDate,
                        voteAverage: item.voteAverage,
                      );

                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: AppSize.s400,
                            width: AppSize.sMax,
                            imageUrl: Urls.imageUrl(item.posterPath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppPadding.p16,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: AppSize.s16,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      AppStrings.nowPlaying,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      } else if (state.nowPlayingMoviesStates == RequestStates.error) {
        return const Center(child: Text('Load data failed'));
      } else {
        return const SizedBox(
          height: AppSize.s400,
          width: AppSize.sMax,
          child: Padding(
            padding: EdgeInsets.only(right: AppPadding.p8),
            child: LoadingWidget(
              height: AppSize.s100,
              width: AppSize.s60,
            ),
          ),
        );
      }
    });
  }
}

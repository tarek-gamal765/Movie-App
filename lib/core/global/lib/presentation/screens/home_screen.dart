import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/drawer_widget.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/movie/presentation/screens/main_movies.dart';
import 'package:movie_app/tv/presentation/screens/main_tvs.dart';

import '../../../../utils/app_constants.dart';
import '../../../../utils/app_strings.dart';
import '../bloc/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _drawerAnimationController;
  late Animation _drawerAnimation;

  late AnimationController _colorAnimationController;
  late Animation _colorAnimation;

  @override
  void initState() {
    _drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: AppConstants.animationDuration500,
      ),
    );
    _drawerAnimation = Tween(
      begin: AppConstants.beginDuration,
      end: AppConstants.endDuration,
    ).animate(_drawerAnimationController);
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: AppConstants.animationDuration0,
      ),
    );
    _colorAnimation = ColorTween(
      begin: AppColorsDark.transparentColor,
      end: AppColorsDark.blackColor.withOpacity(AppSize.s0_7),
    ).animate(_colorAnimationController);
    super.initState();
  }

  void closeDrawer() => _drawerAnimationController.isDismissed
      ? _drawerAnimationController.forward()
      : _drawerAnimationController.reverse();

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    _drawerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _drawerAnimation,
        builder: (context, widget) {
          double slide = 300.0 * _drawerAnimation.value;
          double scale = 1.0 - (_drawerAnimation.value * 0.25);
          double radius = _drawerAnimation.value * 30.0;
          double rotate = _drawerAnimation.value * -0.1;
          double toolbarOpacity = 1.0 - _drawerAnimation.value;
          return Material(
            child: Stack(
              children: [
                DrawerWidget(
                  closeFun: closeDrawer,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale)
                    ..rotateZ(rotate),
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: AnimatedBuilder(
                      animation: _colorAnimationController,
                      builder: (context, child) {
                        return Scaffold(
                          extendBodyBehindAppBar: true,
                          appBar: AppBar(
                            toolbarOpacity: toolbarOpacity,
                            leading: IconButton(
                              icon: const Icon(Icons.menu),
                              splashRadius: AppSize.s20,
                              onPressed: closeDrawer,
                            ),
                            title: const Text(
                              AppStrings.mdb,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.s20,
                              ),
                            ),
                            actions: [
                              BlocBuilder<AppBloc, AppState>(
                                builder: (context, state) {
                                  return IconButton(
                                    icon: const Icon(Icons.search),
                                    splashRadius: AppSize.s20,
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                        state.typeState ==
                                                GeneralContentStates.movie
                                            ? Routes.searchMovieRoute
                                            : Routes.searchTvRoute,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                            backgroundColor: _colorAnimation.value,
                            elevation: AppSize.s0,
                          ),
                          body: NotificationListener<ScrollNotification>(
                            onNotification: _scrollListener,
                            child: BlocBuilder<AppBloc, AppState>(
                              builder: (_, state) {
                                if (state.typeState ==
                                    GeneralContentStates.movie) {
                                  return const MainMoviesScreen();
                                } else {
                                  return const MainTvsScreen();
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

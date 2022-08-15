import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/screens/home_screen.dart';
import 'package:movie_app/movie/presentation/screens/popular_movies.dart';
import 'package:movie_app/movie/presentation/screens/top_rated_movies.dart';

import '../../movie/presentation/screens/details_screen.dart';
import '../../movie/presentation/screens/main_movies.dart';
import 'app_strings.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String movieRoute = '/movie';
  static const String movieDetailsRoute = '/movieDetails';
  static const String popularMoviesRoute = '/popularMovies';
  static const String topRatedMoviesRoute = '/topRatedMovies';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.movieRoute:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());
      case Routes.popularMoviesRoute:
        return MaterialPageRoute(builder: (_) => const PopularMoviesScreen());
      case Routes.topRatedMoviesRoute:
        return MaterialPageRoute(builder: (_) => const TopRatedMoviesScreen());
      case Routes.movieDetailsRoute:
        return MaterialPageRoute(
            builder: (_) =>
                MovieDetailsScreen(id: routeSettings.arguments as int));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}

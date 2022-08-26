import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/screens/home_screen.dart';
import 'package:movie_app/movie/presentation/screens/popular_movies.dart';
import 'package:movie_app/movie/presentation/screens/top_rated_movies.dart';
import 'package:movie_app/tv/presentation/screens/main_tvs.dart';
import 'package:movie_app/tv/presentation/screens/popular_tvs.dart';
import 'package:movie_app/tv/presentation/screens/top_rated_tvs.dart';
import 'package:movie_app/tv/presentation/screens/tv_details.dart';
import 'package:movie_app/core/global/lib/presentation/screens/watchlist_screen.dart';
import '../../movie/presentation/screens/movie_details.dart';
import '../../movie/presentation/screens/main_movies.dart';
import 'app_strings.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String mainMovieRoute = '/mainMovie';
  static const String movieDetailsRoute = '/movieDetails';
  static const String popularMoviesRoute = '/popularMovies';
  static const String topRatedMoviesRoute = '/topRatedMovies';
  static const String mainTvRoute = '/mainTv';
  static const String tvDetailsRoute = '/tvDetails';
  static const String popularTvsRoute = '/popularTvs';
  static const String topRatedTvsRoute = '/topRatedTvs';
  static const String watchlistRoute = '/watchlist';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.mainMovieRoute:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());
      case Routes.popularMoviesRoute:
        return MaterialPageRoute(builder: (_) => const PopularMoviesScreen());
      case Routes.topRatedMoviesRoute:
        return MaterialPageRoute(builder: (_) => const TopRatedMoviesScreen());
      case Routes.movieDetailsRoute:
        return MaterialPageRoute(
            builder: (_) =>
                MovieDetailsScreen(id: routeSettings.arguments as int));
      case Routes.mainTvRoute:
        return MaterialPageRoute(builder: (_) => const MainTvsScreen());
      case Routes.popularTvsRoute:
        return MaterialPageRoute(builder: (_) => const PopularTvsScreen());
      case Routes.topRatedTvsRoute:
        return MaterialPageRoute(builder: (_) => const TopRatedTvsScreen());
      case Routes.tvDetailsRoute:
        return MaterialPageRoute(
            builder: (_) =>
                TvDetailsScreen(id: routeSettings.arguments as int));
      case Routes.watchlistRoute:
        return MaterialPageRoute(builder: (_) => const WatchlistScreen());
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

import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/movie/presentation/screens/movie_watchlist.dart';
import 'package:movie_app/tv/presentation/screens/tv_watchlist.dart';

import '../../../../utils/route_observer.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.watchlist),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: AppStrings.movies,
              ),
              Tab(
                text: AppStrings.tvs,
              ),
            ],
            indicatorColor: Colors.redAccent,
            indicatorWeight: AppSize.s4,
          ),
        ),
        body: const TabBarView(
          children: [
            MovieWatchlist(),
            TvWatchlist(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

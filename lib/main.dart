import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/bloc/app_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/screens/home_screen.dart';
import 'package:movie_app/core/global/styles/themes/dark_theme.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/dependency_injection.dart' as dependency;

import 'dependency_injection.dart';
import 'movie/presentation/blocs/movies_bloc.dart';
import 'movie/presentation/blocs/movies_event.dart';

void main() {
  dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<AppBloc>(),
        ),
        BlocProvider(
          create: (context) => di<MovieBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: darkTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homeRoute,
        home: const HomeScreen(),
      ),
    );
  }
}

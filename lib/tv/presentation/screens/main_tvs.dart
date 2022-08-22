import 'package:flutter/material.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/title_and_see_more_widget.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import '../../../core/utils/app_strings.dart';
import '../components/on_the_air_tvs_component.dart';
import '../components/popular_tvs_component.dart';
import '../components/top_rated_tvs_component.dart';

class MainTvsScreen extends StatelessWidget {
  const MainTvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OnTheAirTvsComponent(),
          const SizedBox(height: AppSize.s8),
          SubTitleAndSeeMore(
            text: AppStrings.popular,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.popularTvsRoute),
          ),
          const PopularTvsComponent(),
          const SizedBox(height: AppSize.s8),
          SubTitleAndSeeMore(
            text: AppStrings.topRated,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.topRatedTvsRoute),
          ),
          const TopRatedTvsComponent(),
          const SizedBox(height: AppSize.s20),
        ],
      ),
    );
  }
}

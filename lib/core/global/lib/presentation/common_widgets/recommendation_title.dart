import 'package:flutter/material.dart';

import '../../../../utils/values_manager.dart';

class RecommendationTitle extends StatelessWidget {
  const RecommendationTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      sliver: SliverToBoxAdapter(
        child: Text(
          'MORE LIKE THIS',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}

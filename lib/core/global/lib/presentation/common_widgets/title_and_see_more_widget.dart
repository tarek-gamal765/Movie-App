import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/values_manager.dart';

import '../../../../utils/app_strings.dart';

class SubTitleAndSeeMore extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SubTitleAndSeeMore({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Spacer(),
          MaterialButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  AppStrings.seeMore,

                  style: Theme.of(context).textTheme.subtitle2!,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: AppSize.s14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

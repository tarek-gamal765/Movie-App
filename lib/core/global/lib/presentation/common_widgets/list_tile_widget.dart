import 'package:flutter/material.dart';

import '../../../../utils/values_manager.dart';
import '../../../styles/app_colors/app_colors_dark.dart';

class ListTileWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ListTileWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10)),
        leading: Icon(
          iconData,
          color: AppColorsDark.greyColor,
          size: AppSize.s20,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: isSelected
                ? AppColorsDark.whiteColor
                : AppColorsDark.greyColor,
          ),
        ),
        selectedTileColor: AppColorsDark.redAccentColor,
        onTap: onTap,
        selected: isSelected,
      ),
    );
  }
}
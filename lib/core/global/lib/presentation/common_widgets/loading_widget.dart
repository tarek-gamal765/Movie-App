import 'package:flutter/material.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  final double width;

  const LoadingWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[AppSize.s850]!,
      highlightColor: Colors.grey[AppSize.s800]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColorsDark.blackColor,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../utils/values_manager.dart';
import 'loading_widget.dart';

class CardItem extends StatelessWidget {
  final String imageUrl;

  const CardItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s160,
      width: AppSize.s120,
      margin: const EdgeInsets.only(left: AppMargin.m10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, text) => const LoadingWidget(
          height: AppSize.s160,
          width: AppSize.s120,
        ),
      ),
    );
  }
}

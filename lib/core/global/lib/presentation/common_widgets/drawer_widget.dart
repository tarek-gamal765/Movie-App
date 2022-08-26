import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/list_tile_widget.dart';
import 'package:movie_app/core/utils/routes.dart';

import '../../../../utils/app_strings.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/images_assets.dart';
import '../../../../utils/values_manager.dart';
import '../../../styles/app_colors/app_colors_dark.dart';
import '../bloc/app_bloc.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback closeFun;

  const DrawerWidget({
    Key? key,
    required this.closeFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColorsDark.whiteColor,
            child: IconButton(
              onPressed: closeFun,
              icon: const Icon(
                Icons.close,
                size: AppSize.s20,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s60),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  child: const Image(
                    image: AssetImage(ImageAssets.userImage),
                  ),
                ),
              ),
              const SizedBox(width: AppSize.s16),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tarek Gamal',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: AppSize.s1),
                    ),
                    Text(
                      'tarek@gmail.com',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s10),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return SizedBox(
                width: 200,
                child: Column(
                  children: [
                    ListTileWidget(
                      iconData: Icons.movie,
                      title: AppStrings.movies,
                      isSelected: state.typeState == GeneralContentStates.movie,
                      onTap: () {
                        BlocProvider.of<AppBloc>(context)
                            .add(const AppEvent(GeneralContentStates.movie));
                        closeFun();
                      },
                    ),
                    ListTileWidget(
                      iconData: Icons.tv,
                      title: AppStrings.tvs,
                      isSelected: state.typeState == GeneralContentStates.tv,
                      onTap: () {
                        BlocProvider.of<AppBloc>(context)
                            .add(const AppEvent(GeneralContentStates.tv));
                        closeFun();
                      },
                    ),
                    ListTileWidget(
                      iconData: Icons.watch_later_outlined,
                      title: AppStrings.watchlist,
                      isSelected: false,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.watchlistRoute,
                        );
                        closeFun();
                      },
                    ),
                    ListTileWidget(
                      iconData: Icons.info_outline,
                      title: AppStrings.about,
                      isSelected: false,
                      onTap: () {
                        closeFun();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

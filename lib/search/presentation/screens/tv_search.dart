import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/global/lib/presentation/common_widgets/card_item.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/utils/values_manager.dart';
import 'package:movie_app/search/presentation/components/text_form_field_component.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/urls.dart';
import '../blocs/search_bloc.dart';
import '../blocs/search_event.dart';
import '../blocs/search_state.dart';

class TvSearchScreen extends StatelessWidget {
  const TvSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormFieldComponent(
          hintText: AppStrings.searchTvs,
          onChanged: (String? query) {
            if (query!.isNotEmpty) {
              BlocProvider.of<SearchBloc>(context).add(
                SearchTvEvent(query),
              );
            }
          },
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.searchTvsStates) {
            case RequestStates.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestStates.success:
              return Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p12,
                  right: AppPadding.p12,
                  top: AppPadding.p14,
                ),
                child: ListView.separated(
                  itemCount: state.searchTvs.length,
                  itemBuilder: (context, index) => CardItem(
                    overview: state.searchTvs[index].overview,
                    releaseDate: state.searchTvs[index].firstAirDate,
                    voteAverage: state.searchTvs[index].voteAverage,
                    imageUrl: Urls.imageUrl(state.searchTvs[index].posterPath),
                    title: state.searchTvs[index].name,
                    color: AppColorsDark.lightBlackColor,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSize.s8),
                ),
              );
            case RequestStates.error:
              return Center(
                child: Text(state.searchTvsMessage),
              );
          }
        },
      ),
    );
  }
}

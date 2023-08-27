import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../favorites/data/utils/favorites_cache_helper.dart';
import '../../../settings/bloc/localization/utils/app_localization.dart';
import '../../../shows/data/models/show.dart';

import '../../../favorites/bloc/favorites_bloc.dart';

// ignore: must_be_immutable
class SelectWatchingStatus extends StatelessWidget {
  SelectWatchingStatus({super.key, required this.show});

  Show show;

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      "never".tr(context),
      "still".tr(context),
      "finished".tr(context),
    ];

    return DropdownMenu<String>(
      textStyle: const TextStyle(fontSize: 18),
      initialSelection: show.watchingStatus == "never"
          ? "never".tr(context)
          : show.watchingStatus == "still"
              ? "still".tr(context)
              : "finished".tr(context),
      onSelected: (String? value) async {
        value == "never".tr(context)
            ? show.watchingStatus = "never"
            : value == "still".tr(context)
                ? show.watchingStatus = "still"
                : show.watchingStatus = "finished";

        FavoritesCacheHelper favoritesCacheHelper = FavoritesCacheHelper();

        if (await favoritesCacheHelper.isFavoriteShow(show)) {
          await favoritesCacheHelper.removeFromFavorites(show);
          await favoritesCacheHelper.addToFavorites(show);
          if (context.mounted) {
            BlocProvider.of<FavoritesBloc>(context)
                .add(GetFavoriteShowsEvent());
          }
        }
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        },
      ).toList(),
    );
  }
}

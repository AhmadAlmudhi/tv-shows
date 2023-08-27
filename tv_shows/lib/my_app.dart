import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/search/bloc/search_bloc.dart';
import 'features/search/data/api/search_api.dart';
import 'features/favorites/bloc/favorites_bloc.dart';
import 'features/favorites/data/utils/favorites_cache_helper.dart';
import 'features/settings/bloc/localization/cubit/locale_cubit.dart';
import 'features/settings/bloc/theme/bloc/theme_bloc.dart';
import 'features/shows/bloc/shows_bloc.dart';
import 'features/shows/data/api/shows_api.dart';
import 'my_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ShowsBloc(showsApi: ShowsApi())..add(GetAllShowsEvent()),
        ),
        BlocProvider(
          create: (context) =>
              FavoritesBloc(favoritesCacheHelper: FavoritesCacheHelper())
                ..add(GetFavoriteShowsEvent()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(searchApi: SearchApi()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, localeState) {
              if (themeState is ThemeLoadedState) {
                return MyMaterialApp(
                  locale: localeState.locale,
                  theme: themeState.theme,
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}

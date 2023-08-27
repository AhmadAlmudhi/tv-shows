import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/theme_cache_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final String theme = await ThemeCacheHelper().getCachedTheme();
        emit(ThemeLoadedState(theme: theme));
      } else if (event is ThemeChangedEvent) {
        final String theme = event.theme;
        await ThemeCacheHelper().cacheTheme(theme);
        emit(ThemeLoadedState(theme: theme));
      }
    });
  }
}

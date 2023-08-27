import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../utils/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale("en")));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();

    if (cachedLanguageCode == "ar") {
      await LanguageCacheHelper().cacheLanguageCode("en");
      emit(ChangeLocaleState(locale: const Locale("en")));
    } else {
      await LanguageCacheHelper().cacheLanguageCode("ar");
      emit(ChangeLocaleState(locale: const Locale("ar")));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/settings/bloc/localization/utils/app_localization.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
    required this.locale,
    required this.theme,
  });

  final Locale locale;
  final String theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      supportedLocales: const [Locale("en"), Locale("ar")],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var local in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == local.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      theme: theme == "light"
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

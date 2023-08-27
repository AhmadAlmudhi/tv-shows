import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/widgets/custom_text.dart';

import '../../bloc/localization/cubit/locale_cubit.dart';
import '../../bloc/theme/bloc/theme_bloc.dart';
import '../widgets/setting_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool langLight = false;
  bool modeLight = false;

  checkCachedSettings() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    final mode = sharedPreferences.getString("THEME");

    setState(() {
      langLight = cachedLanguageCode == "ar";
      modeLight = mode == "dark";
    });
  }

  @override
  void initState() {
    checkCachedSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Row(children: [CustomText(data: "preferences")]),
          const Divider(thickness: 2),
          SettingField(
            data: "arabic_langeuage",
            light: langLight,
            onChange: (bool value) {
              setState(() {
                langLight = value;
                BlocProvider.of<LocaleCubit>(context).changeLanguage();
              });
            },
          ),
          SettingField(
            data: "dark_mode",
            light: modeLight,
            onChange: (bool value) {
              setState(() {
                modeLight = value;
                String theme = "";
                value == true ? theme = "dark" : theme = "light";
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeChangedEvent(theme: theme));
              });
            },
          ),
        ],
      ),
    );
  }
}

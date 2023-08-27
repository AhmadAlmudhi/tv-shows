import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheTheme(String theme) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("THEME", theme);
  }

  Future<String> getCachedTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedTheme = sharedPreferences.getString("THEME");
    return cachedTheme ?? "light";
  }
}

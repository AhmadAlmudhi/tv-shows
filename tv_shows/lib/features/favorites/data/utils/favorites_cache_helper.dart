import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../shows/data/models/show.dart';

class FavoritesCacheHelper {
  Future<List<Show>> getFavoriteShows() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final List<String>? favorites =
        sharedPreferences.getStringList("FAVORITES");

    final List<Show> shows =
        favorites?.map((show) => Show.fromJson(jsonDecode(show))).toList() ??
            [];

    return shows;
  }

  Future<void> addToFavorites(Show show) async {
    List<Show> favoriteShows = await getFavoriteShows();
    if (favoriteShows.contains(show)) {}
    favoriteShows.add(show);
    updateFavorites(favoriteShows);
  }

  Future<void> removeFromFavorites(Show show) async {
    List<Show> favoriteShows = await getFavoriteShows();
    favoriteShows.removeWhere((element) => element.id == show.id);
    updateFavorites(favoriteShows);
  }

  Future<bool> isFavoriteShow(Show show) async {
    final shows = await getFavoriteShows();
    shows.firstWhere(
      (element) => element.id == show.id,
      orElse: () => show,
    );
    for (var element in shows) {
      if (element.id == show.id) {
        return true;
      }
    }
    return false;
  }

  Future<void> updateFavorites(List<Show> shows) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final List<String> updatedFavorites =
        shows.map((show) => jsonEncode(show.toJson())).toList();

    sharedPreferences.setStringList("FAVORITES", updatedFavorites);
  }

  Future<Show> addedToFavoritesCheck(Show show) async {
    final List<Show> shows = await getFavoriteShows();

    final Show updatedShow = shows.firstWhere(
      (element) => element.id == show.id,
      orElse: () => show,
    );

    // if the show is added to favorites (isFavorite, watchingStatus) gets updated.
    return updatedShow;
  }
}

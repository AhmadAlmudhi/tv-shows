import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/show.dart';

class ShowsApi {
  Future<List<Show>> getAllShows(int pageNumber) async {
    String url = "https://www.episodate.com/api/most-popular?page=$pageNumber";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List responseList = (jsonDecode(response.body))["tv_shows"];

      List<Show> shows =
          responseList.map((json) => Show.fromJson(json)).toList();

      return shows;
    } else {
      return [];
    }
  }
}

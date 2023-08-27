import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shows/data/models/show.dart';

class SearchApi {
  Future<List<Show>> search(String name, int pageNumber) async {
    try {
      String url =
          "https://www.episodate.com/api/search?q=$name&page=$pageNumber";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List responseList = (jsonDecode(response.body))["tv_shows"];

        List<Show> shows =
            responseList.map((json) => Show.fromJson(json)).toList();

        return shows;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

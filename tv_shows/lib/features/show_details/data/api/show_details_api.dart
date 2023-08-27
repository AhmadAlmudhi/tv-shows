import 'dart:convert';
import '../models/show_details.dart';
import 'package:http/http.dart' as http;

class ShowDetailsApi {
  Future<ShowDetails> getShowDetails(int showId) async {
    String url = "https://www.episodate.com/api/show-details?q=$showId";
    var response = await http.get(Uri.parse(url));

    try {
      ShowDetails showDetails =
          ShowDetails.fromJson((jsonDecode(response.body))["tvShow"]);

      return showDetails;
    } catch (e) {
      rethrow;
    }
  }
}

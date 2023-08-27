class ShowDetails {
  String description;
  String country;
  String status;
  String network;
  String rating;
  String ratingCount;
  List<String> genres;

  ShowDetails({
    required this.description,
    required this.country,
    required this.status,
    required this.network,
    required this.rating,
    required this.ratingCount,
    required this.genres,
  });

  factory ShowDetails.fromJson(Map<String, dynamic> json) {
    return ShowDetails(
      description: json['description'],
      country: json['country'],
      status: json['status'],
      network: json['network'],
      rating: double.parse(json['rating']).toStringAsFixed(1),
      ratingCount: json['rating_count'],
      genres: json['genres'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['country'] = country;
    data['status'] = status;
    data['network'] = network;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['genres'] = genres;
    return data;
  }
}

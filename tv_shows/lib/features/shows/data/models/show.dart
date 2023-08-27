class Show {
  int id;
  String name;
  String image;
  bool isFavorite;
  String watchingStatus;

  Show(
      {required this.id,
      required this.name,
      required this.image,
      required this.isFavorite,
      required this.watchingStatus});

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      name: json['name'],
      image: json['image_thumbnail_path'] == "https://static.episodate.com"
          ? "https://media.istockphoto.com/id/653116850/vector/tv-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=Naacj5SkEFDKoCObVJUAJOD2iy0XrFjz8-x6WO-sv94="
          : json['image_thumbnail_path'],
      isFavorite: json["is_favorite"] ?? false,
      watchingStatus: json["watching_status"] ?? 'never',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_thumbnail_path'] = image;
    data["is_favorite"] = isFavorite;
    data["watching_status"] = watchingStatus;

    return data;
  }
}

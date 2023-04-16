class DetailModel {
  final int runtime;
  final List<String> genres;

  DetailModel.fromJson(Map<String, dynamic> json)
      : runtime = json['runtime'],
        genres = List<String>.from(
            json['genres'].map((genre) => genre['name'].toString()));
}

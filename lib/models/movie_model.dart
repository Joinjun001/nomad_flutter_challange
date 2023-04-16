class MovieModel {
  final bool adult;
  final String originTitle;
  final String overview;
  final String releaseDate;
  final String title;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json["adult"],
        originTitle = json["original_title"],
        overview = json["overview"],
        releaseDate = json["release_date"],
        title = json["title"],
        posterPath = json["poster_path"],
        backdropPath = json["backdrop_path"],
        voteAverage = json["vote_average"].toDouble(),
        popularity = json["popularity"].toDouble(),
        id = json["id"].toString();
}

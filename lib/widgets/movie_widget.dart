import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail.dart';

class Movie extends StatelessWidget {
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

  const Movie({
    super.key,
    required this.posterPath,
    required this.adult,
    required this.originTitle,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.popularity,
    required this.backdropPath,
    required this.voteAverage,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(
              posterPath: posterPath,
              adult: adult,
              originTitle: originTitle,
              overview: overview,
              releaseDate: releaseDate,
              title: title,
              popularity: popularity,
              backdropPath: backdropPath,
              voteAverage: voteAverage,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/$posterPath",
          ),
        ),
      ),
    );
  }
}

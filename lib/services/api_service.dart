import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/detail_model.dart';
import 'package:movie_app/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String comingSoon = "coming-soon";
  static const String inCinemas = "now-playing";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500/";

  static Future<List<List<MovieModel>>> getMovie() async {
    final popularUrl = Uri.parse('$baseUrl/$popular');
    final comingSoonUrl = Uri.parse('$baseUrl/$comingSoon');
    final inCinemasUrl = Uri.parse('$baseUrl/$inCinemas');
    final responsePopular = await http.get(popularUrl);
    final responseComing = await http.get(comingSoonUrl);
    final responseInCinemas = await http.get(inCinemasUrl);

    if (responsePopular.statusCode == 200 &&
        responseInCinemas.statusCode == 200 &&
        responseComing.statusCode == 200) {
      final List<dynamic> popularMovies =
          jsonDecode(responsePopular.body)['results'];
      final List<dynamic> comingMovies =
          jsonDecode(responseComing.body)['results'];
      final List<dynamic> cinemaMovies =
          jsonDecode(responseInCinemas.body)['results'];

      final List<MovieModel> popularMovieInstances =
          popularMovies.map((movie) => MovieModel.fromJson(movie)).toList();
      final List<MovieModel> comingMovieInstances =
          comingMovies.map((movie) => MovieModel.fromJson(movie)).toList();
      final List<MovieModel> cinemaMovieInstances =
          cinemaMovies.map((movie) => MovieModel.fromJson(movie)).toList();
      return [
        popularMovieInstances,
        comingMovieInstances,
        cinemaMovieInstances
      ];
    }
    throw Error();
  }

  static Future<DetailModel> getMovieById(String id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return DetailModel.fromJson(movie);
    }
    throw Error();
  }
}

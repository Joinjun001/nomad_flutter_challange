import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/widgets/movie_widget.dart';
import 'package:movie_app/widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<List<MovieModel>>> movies = ApiService.getMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191233),
      appBar: AppBar(
        title: const Text(
          "What's your movie",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFF191233),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FutureBuilder(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movieLists = snapshot.data;
                    final popularMovies = movieLists![0];
                    final comingMovies = movieLists[1];
                    final cinemaMovies = movieLists[2];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Popular Movies",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: popularMovies.length,
                            itemBuilder: (context, index) {
                              var pmovie = popularMovies[index];
                              return PopularMovie(
                                posterPath: pmovie.posterPath,
                                popularity: pmovie.popularity,
                                adult: pmovie.adult,
                                releaseDate: pmovie.releaseDate,
                                originTitle: pmovie.originTitle,
                                overview: pmovie.overview,
                                title: pmovie.title,
                                backdropPath: pmovie.backdropPath,
                                voteAverage: pmovie.voteAverage,
                                id: pmovie.id,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Now In Cinemas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cinemaMovies.length,
                            itemBuilder: (context, index) {
                              var cmovie = cinemaMovies[index];
                              return Movie(
                                posterPath: cmovie.posterPath,
                                popularity: cmovie.popularity,
                                adult: cmovie.adult,
                                releaseDate: cmovie.releaseDate,
                                originTitle: cmovie.originTitle,
                                overview: cmovie.overview,
                                title: cmovie.title,
                                backdropPath: cmovie.backdropPath,
                                voteAverage: cmovie.voteAverage,
                                id: cmovie.id,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Coming Soon",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: comingMovies.length,
                            itemBuilder: (context, index) {
                              var comingMovie = comingMovies[index];
                              return Movie(
                                posterPath: comingMovie.posterPath,
                                popularity: comingMovie.popularity,
                                adult: comingMovie.adult,
                                releaseDate: comingMovie.releaseDate,
                                originTitle: comingMovie.originTitle,
                                overview: comingMovie.overview,
                                title: comingMovie.title,
                                backdropPath: comingMovie.backdropPath,
                                voteAverage: comingMovie.voteAverage,
                                id: comingMovie.id,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

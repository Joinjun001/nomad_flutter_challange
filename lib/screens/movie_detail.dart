import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/models/detail_model.dart';
import 'package:movie_app/services/api_service.dart';

class MovieDetail extends StatefulWidget {
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

  const MovieDetail({
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
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<DetailModel> detail;
  @override
  void initState() {
    super.initState();
    detail = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF191233),
        title: const Text(
          "Back to list",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${widget.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.title.length > 13 ? 30 : 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: widget.voteAverage / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      FutureBuilder(
                          future: detail,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final moviedetail = snapshot.data;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    '${moviedetail!.runtime} minutes',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    moviedetail.genres.join(", "),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const Text(
                                    "Storyline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.overview,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 250,
                                      height: 50,
                                      child: const Center(
                                        child: Text(
                                          "티켓 사세요 허허",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  const MovieSlider({Key? key, required this.movies, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      //color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movies[index])),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        //color: Colors.green,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-details'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center)
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';

import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines', textAlign: TextAlign.center),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(),
            ],
          ),
        ));
  }
}

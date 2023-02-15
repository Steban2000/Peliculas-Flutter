import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/provaider/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text("Peliculas en cines"),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.search_outlined),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
//Tarjetas principales

            CardSiwiper(movies: moviesProvider.onDisplayMovies),

//Slider de peliculas

            MovieSlider(
                movies: moviesProvider.popularMovies, title: "Populares"),
          ],
        ),
      ),
    );
  }
}

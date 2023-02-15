import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//TODO: Cambiar luego por una intancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _OverView(),
            _OverView(),
            _OverView(),
            _OverView(),
            _OverView(),
            _OverView(),
            CastingCards()
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/500x300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie.title",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "movie.originalTitle",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 26, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text("movie.voteAverage",
                      style: Theme.of(context).textTheme.caption)
                ],
              )
            ],
          )
        ]));
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        "Laboris adipisicing pariatur mollit deserunt et reprehenderit. Cillum aliquip irure eu consectetur. Adipisicing dolore sint culpa enim in ad ad velit labore. Mollit fugiat elit officia amet mollit amet adipisicing labore cillum ex irure occaecat excepteur et. Aliquip adipisicing minim reprehenderit anim adipisicing qui ea.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

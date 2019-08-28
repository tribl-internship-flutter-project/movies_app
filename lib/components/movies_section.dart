import 'package:flutter/material.dart';
import 'movie_card.dart';

class MoviesSection extends StatelessWidget {
  final movies;

  MoviesSection({ this.movies });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Recommended For You'.toUpperCase(),
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text('See all',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 0.6)))
                  ],
                )),
            Container(
                height: 230,
                margin: const EdgeInsets.only(top: 16, left: 24.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return MovieCard(movie: movies[index]);
                  },
                  itemCount: movies.length,
                ))
          ],
        ));
  }
}
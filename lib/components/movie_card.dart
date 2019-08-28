import 'package:flutter/material.dart';
import 'rating.dart';
import '../screens/movie_screen.dart';



class MovieCard extends StatelessWidget {
  MovieCard({ this.movie });

  final movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                print('it got here');
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SingleMoviePage(movie: movie)));
              },
              child: Hero(
                tag: 'image-${movie['id']}',
                child: Container(
                  width: 130,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(movie['image']), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
                width: 130,
                child: Text(
                  movie['title'],
                  style: TextStyle(color: Colors.white),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: const EdgeInsets.only(top: 5.0)),
            Rating(size: 15)
          ],
        ));
  }
}
import 'package:flutter/material.dart';
import '../components/search_input.dart';
import '../components/rating.dart';
import '../data.dart';
import 'movie_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();

  var moviesData = DATA;

  void _handleSearch(String text) {
    // filter movie list based on search text
    final data = DATA.where((movie) {
      final String title = movie['title'];
      return title.toLowerCase().contains(text.toLowerCase());
    });
    // update list of movies
    setState(() {
      moviesData = data.toList();
    });
    print(moviesData);
  }

  @override
  Widget build(BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(92, 160, 211, 1),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                  bottom: 10, top: (_statusBarHeight + 10), left: 20),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
              )),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
                child: Hero(
                    tag: 'search_field',
                    child: SearchInput(
                        controller: _textController, onSearch: _handleSearch))),
          ),
          Flexible(child: SearchPageBottom(movies: moviesData), flex: 2, fit: FlexFit.tight)
        ],
      )),
    );
  }
}


class SearchPageBottom extends StatelessWidget {
  var movies;

  SearchPageBottom({ this.movies });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 56, 72, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
      child: MoviesList(movies: movies),
    );
  }
}

class MoviesList extends StatelessWidget {
  var movies;

  MoviesList({ this.movies });

  @override
  Widget build(BuildContext context) {
    return Container(

            margin: const EdgeInsets.only(),
            child: ListView.builder(
              itemBuilder: (_, index) {
                return MovieItem(movie: movies[index]);
              },
              itemCount: movies.length,
            ));
  }
}

class MovieItem extends StatelessWidget {
  final movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SingleMoviePage(movie: movie)));
          },
          child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
          Hero(
            tag: 'image-${movie['id']}',
            child: Container(
              height: 85,
              width: 65,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(movie['image']), fit: BoxFit.cover)),
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        movie['title'],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Rating(size: 15)
                ],
              ),
            ),
          )
      ],
    ),
        ));
  }
}

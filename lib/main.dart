import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 160, 211, 1),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 55.0, left: 55, right: 55),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: Text('Hello, What do you want to watch?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(left: 8),
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6)),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          focusColor: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Flexible(child: PageBottom())
        ],
      )),
    );
  }
}

class PageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 56, 72, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(top: 40.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[MoviesSection(), MoviesSection()],
        ),
      ),
    );
  }
}

class MoviesSection extends StatelessWidget {
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
                final i = index + 1;
                return MovieCard(image: 'assets/movie${i < 4 ? i : 1}.png');
              },
              itemCount: 5,
            ))
      ],
    ));
  }
}

class Rating extends StatelessWidget {
  final double size;

  Rating({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.star, color: Color.fromRGBO(252, 211, 7, 1), size: size),
          Icon(Icons.star, color: Color.fromRGBO(252, 211, 7, 1), size: size),
          Icon(Icons.star, color: Color.fromRGBO(252, 211, 7, 1), size: size),
          Icon(Icons.star, color: Color.fromRGBO(252, 211, 7, 1), size: size),
          Icon(Icons.star, color: Color.fromRGBO(252, 211, 7, 0.3), size: size),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  MovieCard({this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 130,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            Container(
                child: Text(
                  'Avengers EndGame',
                  style: TextStyle(color: Colors.white),
                ),
                margin: const EdgeInsets.only(top: 5.0)),
            Rating(size: 15)
          ],
        ));
  }
}

// SecondPage

class SingleMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 56, 72, 1),
      body: Container(
        child: Column(
          children: <Widget>[
            // hero part
            Container(
                height: 300,
                padding: EdgeInsets.only(top: _statusBarHeight, left: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/hero.png'),
                        fit: BoxFit.cover)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ))
                  ],
                )),
            // bottom part
            Flexible(child: SingleMoviePageBottom())
          ],
        ),
      ),
    );
  }
}

class ActorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            final i = index+1;
            return ActorCard(image: 'assets/actor$i.png');
          },
          itemCount: 4,
        )
    );
  }
}

class ActorCard extends StatelessWidget {
  final String image;

  ActorCard({ this.image });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image))
            ),
          ),

          Container(child: Text('Jason Momoa', textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)), ))
        ],
      ),
    );
  }
}




class SingleMoviePageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Aquaman',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Watch Now'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                    ),
                    Rating(size: 20)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                    'In 1985 Maine, lighthouse keeper Thomas Curry rescues Atlanna, the queen of the underwater nation of Atlantis, during a storm. They eventually fall in love and have a son named Arthur, who is born with the power to communicate with marine lifeforms. ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color.fromRGBO(255, 255, 255, 0.7), height: 1.5),
                  ),
              ),
              Container(child: ActorsList(), margin: const EdgeInsets.only(bottom: 16)),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Text('Studio', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
                    ),
                    Text('Warner Bros', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),)

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Text('Genre', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
                    ),
                    Text('Action, Adventure, Fantasy', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),)
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Text('Release', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
                  ),
                  Text('2018', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),)
                ],
              )
            ],
          )),
    );
  }
}


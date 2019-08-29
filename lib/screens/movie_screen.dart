import 'package:flutter/material.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_player/youtube_player.dart';
import '../components/rating.dart';
import '../components/actors_list.dart';

class SingleMoviePage extends StatefulWidget {
  final movie;

  SingleMoviePage({Key key, this.movie}) : super(key: key);

  @override
  _SingleMoviePageState createState() => _SingleMoviePageState();
}

class _SingleMoviePageState extends State<SingleMoviePage> {
//  YoutubePlayerController _controller = YoutubePlayerController();
// var youtube = new FlutterYoutube();
   VideoPlayerController _controller;

  String _playerStatus = "";
  String _errorCode = '0';



//  void listener() {
//    if (_controller.value.playerState == PlayerState.ENDED) {
//      print('Thank you sir');
//    }
//    if (mounted) {
////      setState(() {
////        _playerStatus = _controller.value.playerState.toString();
////        _errorCode = _controller.value.errorCode.toString();
////      });
//    }
//  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          final _statusBarHeight = MediaQuery.of(context).padding.top + 20.0;
          return SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: _statusBarHeight, right: 16 ),
                alignment: Alignment.centerRight,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, size: 40, color: Colors.white,),
                  ),
                )
              ),
              Flexible(
                child: Center(
                  child: Container(
                    child: YoutubePlayer(
                      context: context,
                      source: widget.movie['videoId'],
                      quality: YoutubeQuality.HIGH,
                      callbackController: (controller) {
                        _controller = controller;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );},
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movie);
    final movie = widget.movie;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 56, 72, 1),
      body: Container(
        child: Column(
          children: <Widget>[
            // hero part
            Hero(
              tag: 'image-${movie['id']}',
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  padding: EdgeInsets.only(top: _statusBarHeight, left: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(movie['image']),
                          fit: BoxFit.cover)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )),
            ),
            // bottom part
            Flexible(
                child:
                    SingleMoviePageBottom(movie: movie, showMovie: _showDialog))
          ],
        ),
      ),
    );
  }
}

class SingleMoviePageBottom extends StatelessWidget {
  final movie;
  final showMovie;

  SingleMoviePageBottom({this.movie, this.showMovie});

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
                  movie['title'],
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
                      onPressed: () {
                        showMovie();
                      },
                      child: Text('Watch Now'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                    ),
                    Rating(size: 20)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'In 1985 Maine, lighthouse keeper Thomas Curry rescues Atlanna, the queen of the underwater nation of Atlantis, during a storm. They eventually fall in love and have a son named Arthur, who is born with the power to communicate with marine lifeforms. ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      height: 1.5),
                ),
              ),
              Container(
                  child: ActorsList(),
                  margin: const EdgeInsets.only(bottom: 16)),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Text(
                        'Studio',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Warner Bros',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Text(
                        'Genre',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Action, Adventure, Fantasy',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Text(
                      'Release',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '2018',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
                  )
                ],
              )
            ],
          )),
    );
  }
}



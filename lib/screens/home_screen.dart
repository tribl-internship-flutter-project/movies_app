import 'package:flutter/material.dart';
import '../components/movies_section.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 160, 211, 1),
      body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
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
              ),
              Flexible(child: PageBottom(), flex:2 )
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
          children: <Widget>[
            MoviesSection(movies: DATA.take(4).toList()),
            MoviesSection(movies: DATA.skip(4).take(4).toList())
          ],
        ),
      ),
    );
  }
}
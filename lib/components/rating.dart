import 'package:flutter/material.dart';

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
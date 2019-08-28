import 'package:flutter/material.dart';

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
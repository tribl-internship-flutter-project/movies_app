import 'package:flutter/material.dart';
import 'actor_card.dart';

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
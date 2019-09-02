import 'package:flutter/material.dart';


class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final onSearch;

  SearchInput({ this.controller, this.onSearch });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(left: 8),
              margin: const EdgeInsets.only(bottom: 30.0),
              child: TextField(
                controller: controller,
                onChanged: (String text){
                  onSearch(text);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6)),

                  border: InputBorder.none,
                  icon: IconButton(
                    onPressed: (){
                      onSearch(controller.text);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}

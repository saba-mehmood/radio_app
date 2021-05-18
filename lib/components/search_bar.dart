import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search),
          Flexible(child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
              hintText: 'Search Radio',
            ),
          ),),
          Spacer(),

        ],
      ),
    );
  }
}


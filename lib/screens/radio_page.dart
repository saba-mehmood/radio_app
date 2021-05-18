import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/components/radio_list.dart';
import 'now_playing_template.dart';
import 'package:radio_app/components/search_bar.dart';
import 'package:radio_app/components/app_logo.dart';

class RadioPage extends StatefulWidget {
  final bool isFavouriteOnly;

  RadioPage({ Key key, this.isFavouriteOnly}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //AppLogo is created in app_bar.dart file
          AppLogo(),
          //SearchBar is created in search_bar.dart file
          SearchBar(),

        RadioList(),
          NowPlayingTemplate(
            radioTitle: "Current Radio Playing",
            radioImageURL:
                "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
          )
        ],
      ),
    );
  }

}

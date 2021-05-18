

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:radio_app/models/radio.dart';
import 'package:velocity_x/velocity_x.dart';

class RadioRowTemplate extends StatefulWidget {
  final RadioModel radioModel;

  @override
  RadioRowTemplate({Key key, this.radioModel}) : super(key: key);

  @override
  _RadioRowTemplateState createState() => _RadioRowTemplateState();
}

class _RadioRowTemplateState extends State<RadioRowTemplate> {
  @override
  Widget build(BuildContext context) {
    return _buildSongRow();
  }

  Widget _buildSongRow() {
    return ListTile(
      title: Text(this.widget.radioModel.radioName)
          .text
          .hexColor('#182545')
          .bold
          .make(),
      leading: _image(this.widget.radioModel.radioPic),
      subtitle: Text(
        this.widget.radioModel.radioDesc,
        maxLines: 2,
      ).text.make(),
      trailing: Wrap(
        spacing: -10.0, //gap between adjacent chips
        runSpacing: 0.0,
        children: [
          _buildPlayStopIcon(),
          _buildAddFavouriteIcon(),
        ],
      ),
    );
  }

  Widget _image(url, {size}) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(url),
      ),
      height: size == false ? 55 : size,
      width: size = false ? 55 : size,
      decoration: BoxDecoration(
          color: HexColor('#FFE5EC'),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), //changes position of shadow
            )
          ]
      ),
    );
  }
//method play stop button
  Widget _buildPlayStopIcon() {
    return IconButton(
        icon: Icon(Icons.play_circle_filled),
        onPressed: (){},
    );
  }

  //method favourite button
  Widget _buildAddFavouriteIcon() {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      color: HexColor('#9097A6'),
      onPressed: (){},
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';


class NowPlayingTemplate extends StatelessWidget {
  final String radioTitle;
  final String radioImageURL;

  const NowPlayingTemplate({ Key key, this.radioTitle,  this.radioImageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: HexColor('#182545')),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nowPlayingText(context, this.radioTitle, this.radioImageURL)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _nowPlayingText(BuildContext context, String title, String imageURL) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
    child: ListTile(
      title: Text(title).text.white.bold.make(),
      subtitle: Text(
        'Now Playing',
        textScaleFactor: 0.8,
      ).text.white.make(),
      leading: _image(imageURL, size: 50.0),
      trailing: Wrap(
        spacing: -10.0,
        children: [
          _buildStopIcon(context),
          _buildShareIcon(),
        ],
      ),
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
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), //changes position of shadow
          )
        ]),
  );
}

// stop button
Widget _buildStopIcon(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.stop),
    color: HexColor('#9097A6'),
    onPressed: () {},
  );
}

// share button
Widget _buildShareIcon() {
  return IconButton(
    icon: Icon(Icons.share),
    color: HexColor('#9097A6'),
    onPressed: () {},
  );
}

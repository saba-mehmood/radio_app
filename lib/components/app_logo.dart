import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: HexColor('#182545'),
      height: 80,
      child: Padding(padding: EdgeInsets.all(10),
        child: Center(
          child: Text('Radio App').text.size(30).white.make(),
        ),
      ),
    );
  }
}

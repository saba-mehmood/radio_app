import 'package:flutter/material.dart';
import 'package:radio_app/screens/radio_row_template.dart';
import 'package:radio_app/models/radio.dart';

class RadioList extends StatefulWidget {
  @override
  _RadioListState createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  RadioModel radioModel = RadioModel(
    id: 1,
    radioName: "Test Radio 1",
    radioDesc: "Test Radio Desc",
    radioPic: "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ListView(
          children: [
            ListView.separated(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return RadioRowTemplate(
                  radioModel: radioModel,
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}

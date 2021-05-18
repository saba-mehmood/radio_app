import 'package:radio_app/models/base_model.dart';
import 'package:radio_app/models/db_model.dart';

class RadioAPIModel extends BaseModel {
  List<RadioModel> data;

  RadioAPIModel({
   this.data,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    this.data = (json['Data'] as List)
        .map(
          (i) => RadioModel.fromJson(i),
        )
        .toList();
  }
}

class RadioModel extends DBBaseModel{
  static String table = 'radios';

  final int id;
  final String radioName;
  final String radioURL;
  final String radioDesc;
  final String radioWebsite;
  final String radioPic;
  final bool isBookmarked;

  //class constructor
  RadioModel(
      { this.id,
         this.radioName,
         this.radioURL,
         this.radioDesc,
         this.radioWebsite,
         this.radioPic,
         this.isBookmarked});

  //mapping RadioModel with json file
factory RadioModel.fromJson(Map<String, dynamic> json){
  return RadioModel(
    id: json['ID'],
    radioName: json['RadioName'],
    radioURL: json['RadioURL'],
    radioDesc: json['RadioDecs'],
    radioWebsite: json['RadioWebsite'],
    radioPic: json['RadioPic'],
    isBookmarked: false,
  );
}

//this fromMap will use in the sqflite
   static RadioModel fromMap(Map<String, dynamic> map){
  return RadioModel(
    id: map['id'],
    radioName: map['radioName'],
    radioURL: map['radioURL'],
    radioDesc: map['radioDesc'],
    radioWebsite: map['radioWebsite'],
    radioPic: map['radioPic'],
    isBookmarked: map['isFavourate'] == 1 ? true : false,

  );
   }

   Map<String, dynamic> toMap(){
  Map<String, dynamic> map ={
    'radioName': radioName,
    'radioURL':radioURL,
    'radioDesc':radioURL,
    'radioWebsite': radioWebsite,
    'radioPic':radioPic,
  };

  if(id != null){
    map['id'] = id;
  }
  return map;
   }
}

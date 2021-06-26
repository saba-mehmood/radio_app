
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radio_app/models/base_model.dart';

class WebServices{
  Future<BaseModel> getData(String url, BaseModel baseModel) async{
    final response = await http.get(Uri.parse("http://www.SnippetCoder.com/AllRadios.txt"),);

    if(response.statusCode == 200){
      baseModel.fromJson(json.decode(response.body));
      return baseModel;
    } else{
      throw Exception('Failed to load data!');
    }
  }
}

